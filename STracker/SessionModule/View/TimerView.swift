//
//  TimerView.swift
//  STracker
//
//  Created by Денис Сторожик on 28.11.2022.
//

import UIKit

final class TimerView: BaseInfoView {
    
    private let progressView = {
        let view = ProgressView()
        view.drawProgress(with: 0.6)
        return view
    }()
    
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
