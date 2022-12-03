//
//  TimerView.swift
//  STracker
//
//  Created by Денис Сторожик on 28.11.2022.
//

import UIKit

enum TimerState {
    case isRunning
    case isPaused
    case isStopped
}

final class TimerView: BaseInfoView {
    
    private let progressView = ProgressView()
    private var timer = Timer()
    var state: TimerState = .isStopped
    private var timerProgress: CGFloat = 0
    private var timerDuration: Double  = 0
    private let elapsedTimeLable = UILabel(with: C.Strings.Session.elapsedTime, position: .center, size: 14, color: C.Colors.inactive)
    private let elapsedTimeValueLabel = UILabel(position: .center, size: 46, color: C.Colors.darkGray)
    private let remainTimeLabel  = UILabel(with: C.Strings.Session.remainTime, position: .center, size: 13, color: C.Colors.inactive)
    private let remainTimeValueLabel = UILabel(position: .center, size: 23, color: C.Colors.darkGray)
    private let completedView = PercentView()
    private let remainingView = PercentView()
    
    private let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = C.Colors.eliminator
        return view
    }()
    
    private let timeStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fillProportionally
        view.spacing = 10
        return view
    }()
    
    private let bottomStackView: UIStackView = {
        let view = UIStackView()
        view.distribution = .fillProportionally
        view.spacing = 10
        return view
    }()
    
    func configure(with duration: Double, progress: Double) {
        timerDuration = duration
        let tempCurrentValue = progress > duration ? duration : progress
        let tempDivider = duration == 0 ? 1 : duration
        let percent = tempCurrentValue / tempDivider
        let roundedPercent = Int(round(percent * 100))
        
        elapsedTimeValueLabel.text = getDisplayedString(from: Int(tempCurrentValue))
        remainTimeValueLabel.text = getDisplayedString(from: Int(duration) - Int(tempCurrentValue))
        completedView.configure(with: C.Strings.Session.complited, value: roundedPercent)
        remainingView.configure(with: C.Strings.Session.remaining, value: 100 - roundedPercent)
        self.progressView.drawProgress(with: CGFloat(percent))
    }
    
    func startTimer(complition: @escaping (CGFloat)->() ) {
        timer.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.01,
                                     repeats: true,
                                     block: { [weak self] timer in
            guard let self = self else {return}
            self.timerProgress += 0.01
            if self.timerProgress > self.timerDuration {
                self.timerProgress = self.timerDuration
                self.timer.invalidate()
                complition(self.timerProgress)
            }
            self.configure(with: self.timerDuration, progress: self.timerProgress)
        })
    }
    
    func pauseTimer() {
        timer.invalidate()
    }
    
    func stopTimer() {
        guard self.timerProgress > 0 else {return}
        timer.invalidate()
        self.state = .isStopped
        timer = Timer.scheduledTimer(withTimeInterval: 0.01,
                                     repeats: true,
                                     block: { [weak self] timer in
            guard let self = self else {return}
            self.timerProgress -=  self.timerProgress / 4
            if self.timerProgress <=  0 {
                self.timerProgress = 0
                self.timer.invalidate()
            }
            self.configure(with: self.timerDuration, progress: self.timerProgress)
        })
    }
}

extension TimerView {
    
    override func addViews() {
        super.addViews()
        addSubview(progressView)
        addSubview(timeStackView)
        addSubview(bottomStackView)
        
        [elapsedTimeLable, elapsedTimeValueLabel, remainTimeLabel, remainTimeValueLabel].forEach {
            timeStackView.addArrangedSubview($0)
        }
        
        [completedView, separatorView, remainingView].forEach {
            bottomStackView.addArrangedSubview($0)
        }
    }
    
    override func layoutViews() {
        super.layoutViews()
        [progressView, timeStackView, bottomStackView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        let offset: CGFloat = 40
        progressView.pinToSuperview(offset: offset)
        NSLayoutConstraint.activate([
            progressView.heightAnchor.constraint(equalTo: progressView.widthAnchor),
            
            timeStackView.centerYAnchor.constraint(equalTo: progressView.centerYAnchor),
            timeStackView.centerXAnchor.constraint(equalTo: progressView.centerXAnchor),
            
            bottomStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -28),
            bottomStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            bottomStackView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            bottomStackView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1),
            
            separatorView.widthAnchor.constraint(equalToConstant: 1)
        ])
    }
}

private extension TimerView {
    
    func getDisplayedString(from value: Int) -> String {
        let seconds = value % 60
        let minutes = (value / 60) % 60
        let hours = value / 3600
        
        let secondStr = seconds < 10 ? "0\(seconds)" : "\(seconds)"
        let minuteStr = minutes < 10 ? "0\(minutes)" : "\(minutes)"
        let hourStr = hours < 10 ? "0\(hours)" : "\(hours)"
        
        return hours == 0 ? [minuteStr, secondStr].joined(separator: ":") : [hourStr, minuteStr, secondStr].joined(separator: ":")
    }
}
