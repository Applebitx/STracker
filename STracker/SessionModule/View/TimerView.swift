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
    private let elapsedTimeLable = UILabel(with: C.Strings.Session.elapsedTime, position: .center, size: 14, color: C.Colors.inactive)
    private let elapsedTimeValueLabel = UILabel(with: nil, position: .center, size: 46, color: C.Colors.darkGray)
    private let remainTimeLabel  = UILabel(with: C.Strings.Session.remainTime, position: .center, size: 13, color: C.Colors.inactive)
    private let remainTimeValueLabel = UILabel(with: nil, position: .center, size: 23, color: C.Colors.darkGray)
    
    var state: TimerState = .isStopped
    var callback: (() -> ())?
    
    private let timeStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fillProportionally
        view.spacing = 10
        return view
    }()
    
    
    func configure(with duration: Double, progress: Double) {
        timerDuration = duration
        let tempCurrentValue = progress > duration ? duration : progress
        let tempDivider = duration == 0 ? 1 : duration
        let percent = tempCurrentValue / tempDivider
        
        elapsedTimeValueLabel.text = getDisplayedString(from: Int(tempCurrentValue))
        remainTimeValueLabel.text = getDisplayedString(from: Int(duration) - Int(tempCurrentValue))
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
            self.timerProgress -= self.timerProgress / 10
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
        [elapsedTimeLable, elapsedTimeValueLabel, remainTimeLabel, remainTimeValueLabel].forEach {
            timeStackView.addArrangedSubview($0)
        }
    }
    
    override func layoutViews() {
        super.layoutViews()
        [progressView, timeStackView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        let offset: CGFloat = 40
        NSLayoutConstraint.activate([
            progressView.topAnchor.constraint(equalTo: topAnchor, constant: offset),
            progressView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: offset),
            progressView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -offset),
            progressView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -offset),
            progressView.heightAnchor.constraint(equalTo: progressView.widthAnchor),
            
            timeStackView.centerYAnchor.constraint(equalTo: progressView.centerYAnchor),
            timeStackView.centerXAnchor.constraint(equalTo: progressView.centerXAnchor)
        ])
    }
    
    override func configureViews() {
        super.configureViews()
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
