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
    private var timerProgress: CGFloat = 0
    private var timerDuration: Double  = 0
    public var state: TimerState = .isStopped
    
    func configure(with duration: Double, progress: Double) {
        timerDuration = duration
        let tempCurrentValue = progress > duration ? duration : progress
        let tempDivider = duration == 0 ? 1 : duration
        let percent = tempCurrentValue / tempDivider
        
        self.progressView.drawProgress(with: CGFloat(percent))
    }
    
    func startTimer() {
        timer.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.01,
                                     repeats: true,
                                     block: { [weak self] timer in
            guard let self = self else {return}
            self.timerProgress += 0.01
            if self.timerProgress > self.timerDuration {
                self.timerProgress = self.timerDuration
                self.timer.invalidate()
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
        timer = Timer.scheduledTimer(withTimeInterval: 0.01,
                                     repeats: true,
                                     block: { [weak self] timer in
            guard let self = self else {return}
            self.timerProgress -= 0.1
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
    }
    
    override func layoutViews() {
        super.layoutViews()
        progressView.translatesAutoresizingMaskIntoConstraints = false
        let offset: CGFloat = 40
        NSLayoutConstraint.activate([
            progressView.topAnchor.constraint(equalTo: topAnchor, constant: offset),
            progressView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: offset),
            progressView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -offset),
            progressView.heightAnchor.constraint(equalTo: progressView.widthAnchor)
        ])
    }
    
    override func configureViews() {
        super.configureViews()
    }
}
