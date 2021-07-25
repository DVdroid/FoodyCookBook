//
//  LoadingIndicator.swift
//  CustomUIComponents_iOS
//
//  Created by Vikash Anand on 29/08/20.
//  Copyright © 2020 Vikash Anand. All rights reserved.
//

import UIKit

enum State: Equatable {
    case start(inView: UIView?)
    case pause
    case resume
    case stop
}

enum Style: Equatable {
    case activityIndicator
}

protocol LoadingIndicatorProtocol where Self: UIView {
    var isActive: Bool { get }
    var isPaused: Bool { get }
    var state: State { get set }
    init(frame: CGRect)
    init?(coder: NSCoder)
}

final class LoadingIndicator {

    private var loadingView: LoadingIndicatorProtocol?

    var state: State = .stop {
        didSet {

            switch state {
            case .start(inView: let parentView):
                guard let unwrappedParentView = parentView, let unwrappedLoadingView = self.loadingView else { return }
                add(subView: unwrappedLoadingView, inView: unwrappedParentView)
                loadingView?.state = .start(inView: unwrappedParentView)

            case .pause:
                loadingView?.state = .pause

            case .resume:
                loadingView?.state = .resume

            case .stop:
                loadingView?.state = .stop
            }
        }
    }

    init(withStyle style: Style = .activityIndicator) {
        switch style {
        case .activityIndicator:
            loadingView = LoadingIndicator_ActivityIndicator(frame: UIScreen.main.bounds)
        }

        configure()
    }

    private func add(subView: UIView, inView: UIView) {
        subView.translatesAutoresizingMaskIntoConstraints = false
        inView.addSubview(subView)
        NSLayoutConstraint.activate([
            subView.leadingAnchor.constraint(equalTo: inView.safeAreaLayoutGuide.leadingAnchor),
            subView.topAnchor.constraint(equalTo: inView.safeAreaLayoutGuide.topAnchor),
            inView.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: subView.trailingAnchor),
            inView.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: subView.bottomAnchor)
        ])
    }

    private func configure() {

        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(appWillMovedToBackground), name: UIApplication.willResignActiveNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(appDidCameToForeground), name: UIApplication.didBecomeActiveNotification, object: nil)
    }

    @objc private func appWillMovedToBackground() {
        loadingView?.state = .pause
    }

    @objc private func appDidCameToForeground() {
        loadingView?.state = .resume
    }
}
