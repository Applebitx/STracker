//
//  ProgressView.swift
//  STracker
//
//  Created by Денис Сторожик on 28.11.2022.
//

import UIKit

extension TimerView {
    
    final class ProgressView: UIView {
        
        func drawProgress(with percent: CGFloat) {
            layer.sublayers?.removeAll()
            
            //curves
            let circleFrame = UIScreen.main.bounds.width - (15 + 40) * 2
            let radius = circleFrame / 2
            let center = CGPoint(x: radius, y: radius)
            let startAngle = -CGFloat.pi * (7/6)
            let endAngle = CGFloat.pi * (1/6)
            let circlePath = UIBezierPath(arcCenter: center,
                                          radius: radius,
                                          startAngle: startAngle,
                                          endAngle: endAngle,
                                          clockwise: true)
            
            let circleLayer = CAShapeLayer() // main curve
            let defaultCircleLayer = CAShapeLayer() // subcurve
            [defaultCircleLayer,circleLayer].forEach {
                $0.path = circlePath.cgPath
                $0.lineWidth = 20
                $0.lineCap = .round
                $0.fillColor = UIColor.clear.cgColor
                switch $0 {
                case circleLayer:
                    $0.strokeColor = C.Colors.active.cgColor
                    $0.strokeEnd = percent
                default:
                    $0.strokeColor = C.Colors.eliminator.cgColor
                    $0.strokeEnd = 1
                }
                layer.addSublayer($0)
            }
            //dots
            let dotLayer = CAShapeLayer() //white dot
            let dotAngle = CGFloat.pi * (7/6 - (8/6 * percent))
            let dotPoint = CGPoint(x: cos(-dotAngle) * radius + center.x,
                                     y: sin(-dotAngle) * radius + center.y)
            let dotPath = UIBezierPath()
            dotPath.move(to: dotPoint)
            dotPath.addLine(to: dotPoint)
            dotLayer.path = dotPath.cgPath
            dotLayer.fillColor = UIColor.clear.cgColor
            dotLayer.strokeColor = UIColor.white.cgColor
            dotLayer.lineCap = .round
            dotLayer.lineWidth = 8
            
            let fillDotLayer = CAShapeLayer() //blue dot to imitate start of curve
            fillDotLayer.path = dotPath.cgPath
            fillDotLayer.fillColor = UIColor.clear.cgColor
            fillDotLayer.strokeColor = C.Colors.active.cgColor
            fillDotLayer.lineCap = .round
            fillDotLayer.lineWidth = 20
             
            // marks
            let barsLayer = CAShapeLayer()
            let barFrame = UIScreen.main.bounds.width - (15 + 40 + 25) * 2
            let barsRaidus = barFrame / 2
            let startBarRadius = barsRaidus - barsLayer.lineWidth * 0.5
            let endBarRadius = startBarRadius + 6
            let barsPath = UIBezierPath(arcCenter: center,
                                        radius: barsRaidus,
                                        startAngle: startAngle,
                                        endAngle: endAngle,
                                        clockwise: true)
            barsLayer.fillColor = UIColor.clear.cgColor
            barsLayer.strokeColor = UIColor.clear.cgColor
            barsLayer.lineWidth = 6
            barsLayer.path = barsPath.cgPath
            
            //exact marks projection
            var angle: CGFloat = 7 / 6
            (1...9).forEach { _ in
                let barAngle = CGFloat.pi * angle
                let startBarPoint = CGPoint(x: cos(-barAngle) * startBarRadius + center.x,
                                            y: sin(-barAngle) * startBarRadius + center.y)
                let endBarPoint   = CGPoint(x: cos(-barAngle) * endBarRadius + center.x,
                                            y: sin(-barAngle) * endBarRadius + center.y)
                let barPath = UIBezierPath()
                barPath.move(to: startBarPoint)
                barPath.addLine(to: endBarPoint)
                
                //exact mark painting
                let barLayer = CAShapeLayer()
                barLayer.path = barPath.cgPath
                barLayer.fillColor = UIColor.clear.cgColor
                barLayer.strokeColor = angle >= (7/6 - (8/6 * percent)) ? C.Colors.active.cgColor : C.Colors.eliminator.cgColor
                barLayer.lineWidth = 4
                barLayer.lineCap = .round
                
                barsLayer.addSublayer(barLayer)
                angle -= 1/6
            }
            
            layer.addSublayer(fillDotLayer)
            layer.addSublayer(dotLayer)
            layer.addSublayer(barsLayer)
        }
    }
    
}
