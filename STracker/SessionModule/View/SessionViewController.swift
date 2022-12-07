//
//  SessionControllerViewController.swift
//  STracker
//
//  Created by Денис Сторожик on 14.11.2022.
//

import UIKit



class SessionViewController: BaseViewController {
    
    private let timerView = TimerView()
    private let timerDuration: Double = 15
    private let statsView = StatsView()
    private let stepsView = BaseInfoView()
    private let workoutsLabel: UILabel = {
        let lable = UILabel(with: C.Strings.Session.workoutsLabel ,position: .center, size: 13, color: C.Colors.inactive)
        return lable
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func navBarLeftButtonHandler() {
        if timerView.state == .isStopped {
            timerView.startTimer() {_ in
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.navBarRightButtonHandler()
                }}
        } else {
            timerView.pauseTimer()
        }
        timerView.state = timerView.state == .isRunning ? .isStopped : .isRunning
        timerView.state == .isRunning ? addNavBarButtonTitle(position: .left, title: C.Strings.Session.sessionPause) : addNavBarButtonTitle(position: .left, title: C.Strings.Session.sessionStart)
    }
    
    override func navBarRightButtonHandler() {
        addNavBarButtonTitle(position: .left, title: C.Strings.Session.sessionStart)
        timerView.stopTimer()
    }
}

extension SessionViewController {
        
    override func addViews() {
        super.addViews()
        view.addSubview(timerView)
        view.addSubview(stepsView)
        view.addSubview(statsView)
    }
    
    override func layoutViews() {
        timerView.translatesAutoresizingMaskIntoConstraints = false
        statsView.translatesAutoresizingMaskIntoConstraints = false
        stepsView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            timerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            timerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            timerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            timerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.45),
            
            statsView.topAnchor.constraint(equalTo: timerView.bottomAnchor, constant: 40),
            statsView.leadingAnchor.constraint(equalTo: timerView.leadingAnchor),
            statsView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            statsView.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -7.5),
            
            stepsView.topAnchor.constraint(equalTo: timerView.bottomAnchor, constant: 40),
            stepsView.trailingAnchor.constraint(equalTo: timerView.trailingAnchor),
            stepsView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            stepsView.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 7.5)
        ])
    }
    
    
    override func configureViews() {
        super.configureViews()
        title = C.Strings.Session.session
        navigationController?.tabBarItem.title = C.Strings.Session.session
        addNavBarButton(position: .left, title: C.Strings.Session.sessionStart)
        addNavBarButton(position: .right, title: C.Strings.Session.sessionFinish)
        
        timerView.configure(with: timerDuration, progress: 0)
        statsView.configure(with: [.heartRate(value: "155"),
                                   .speed(value: "9'20''"),
                                   .steps(value: "7,682"),
                                   .totalDistance(value: "8.25")])
    }
}



