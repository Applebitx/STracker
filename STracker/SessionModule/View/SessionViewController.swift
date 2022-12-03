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
    private let statsView = BaseInfoView()
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
    }
    
    override func layoutViews() {
        timerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            timerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            timerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            timerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            timerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.45)
        ])
    }
    
    
    override func configureViews() {
        super.configureViews()
        title = C.Strings.Session.session
        navigationController?.tabBarItem.title = C.Strings.Session.session
        addNavBarButton(position: .left, title: C.Strings.Session.sessionStart)
        addNavBarButton(position: .right, title: C.Strings.Session.sessionFinish)
        
        timerView.configure(with: timerDuration, progress: 0)
    }
}



