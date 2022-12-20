//
//  ProgressViewController.swift
//  STracker
//
//  Created by Денис Сторожик on 14.11.2022.
//

import UIKit

class ProgressViewController: BaseViewController {

    private let dailyView: DailyView = {
        let view = DailyView()
        return view
    }()
    
    private var dailyLabel: UILabel = {
        let label = UILabel(with: C.Strings.Progress.daily, position: .center, size: 13, color: C.Colors.inactive)
        return label
    }()
    
    private var mounthlyLabel: UILabel = {
        let label = UILabel(with: C.Strings.Progress.mounthly , position: .center, size: 13, color: C.Colors.inactive)
        return label
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


extension ProgressViewController {
    
    override func addViews() {
        super.addViews()
        
        [dailyLabel, dailyView].forEach {
            view.addSubview($0)
        }
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        [dailyLabel, dailyView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let offset: CGFloat = 15
        
        NSLayoutConstraint.activate([
            dailyLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            dailyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: offset),
            
            dailyView.leadingAnchor.constraint(equalTo: dailyLabel.leadingAnchor),
            dailyView.topAnchor.constraint(equalTo: dailyLabel.bottomAnchor, constant: 5),
            dailyView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.287),
            dailyView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -(offset * 2))
        ])
    }
    
    override func configureViews() {
        super.configureViews()
        
        title = C.Strings.Progress.progress
        navigationController?.tabBarItem.title = C.Strings.Progress.progress
        addNavBarButton(position: .left, title: C.Strings.Progress.progressLeft)
        addNavBarButton(position: .right, title: C.Strings.Progress.progressRight)
        
        //mock data
        dailyView.configure(with: [.init(value: "8K", title: "2/14", heightMultiplier: 1), .init(value: "8K", title: "2/15", heightMultiplier: 0.9), .init(value: "8K", title: "2/16", heightMultiplier: 0.5), .init(value: "8K", title: "2/17", heightMultiplier: 0.7)])
    }
}
