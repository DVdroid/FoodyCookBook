//
//  LoadingIndicator_ActivityIndicator.swift
//  CustomUIComponents_iOS
//
//  Created by Vikash Anand on 23/02/20.
//  Copyright © 2020 Vikash Anand. All rights reserved.
//

import UIKit

final class LoadingIndicator_ActivityIndicator: UIView, LoadingIndicatorProtocol {
    
    private lazy var container: UIView = {
        var container: UIView = UIView()
        container.backgroundColor = UIColor.colorFromHex(rgbValue:0xffffff, alpha: 0.5)
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    private lazy var loadingView: UIView = {
        let width = 80.0
        var loadingView: UIView = UIView(frame: .init(origin: .zero, size: .init(width: width, height: width)))
        loadingView.backgroundColor = UIColor.colorFromHex(rgbValue:0x444444, alpha: 0.7)
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        
        return loadingView
    }()
    
    private lazy var activityIndicatorView: UIActivityIndicatorView = {
        var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
        activityIndicator.style =
            UIActivityIndicatorView.Style.large
        activityIndicator.hidesWhenStopped = true
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }()
    
    private weak var parentView: UIView?
    
    var isActive: Bool {
        return !(self.parentView == nil)
    }
    
    var isPaused: Bool {
        return self.state == State.pause
    }
    
    var state: State = .stop {
        didSet {
            switch state {
            case .start(inView: let parentView):
                if isActive {
                    #if DEBUG
                    print("# Warning :: Received show loading indicator call while one is already in progress.")
                    #endif
                    return
                }
                guard let unwrappedParentView = parentView else { return }
                accessibilityViewIsModal = true
                show(onView: unwrappedParentView)
                self.parentView = parentView
            case .pause:
                accessibilityViewIsModal = false
                remove()
            case .resume:
                guard let unwrappedParentView = self.parentView else { return }
                accessibilityViewIsModal = true
                show(onView: unwrappedParentView)
            case .stop:
                accessibilityViewIsModal = false
                if UIAccessibility.isVoiceOverRunning {
                    UIAccessibility.post(notification: UIAccessibility.Notification.screenChanged, argument: parentView)
                }
                remove()
                parentView = nil
            }
        }
    }
    
    var loadingText: String = "please wait" {
        didSet {
            textLabel.text = loadingText
        }
    }
    
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textAlignment = .center
        label.text = loadingText
        label.textColor = .white
        label.font = UIFont.preferredFont(forTextStyle: .footnote)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        
        container.addSubview(loadingView)
        addSubview(container)
        
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            container.leadingAnchor.constraint(equalTo: leadingAnchor),
            safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: container.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            loadingView.widthAnchor.constraint(equalToConstant: 80),
            loadingView.heightAnchor.constraint(equalToConstant: 85),
            loadingView.centerXAnchor.constraint(equalTo: centerXAnchor),
            loadingView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        loadingView.addSubview(activityIndicatorView)
        NSLayoutConstraint.activate([
            activityIndicatorView.widthAnchor.constraint(equalToConstant: 40),
            activityIndicatorView.heightAnchor.constraint(equalToConstant: 40),
            activityIndicatorView.centerXAnchor.constraint(equalTo: loadingView.centerXAnchor),
            activityIndicatorView.centerYAnchor.constraint(equalTo: loadingView.centerYAnchor)
        ])

        loadingView.addSubview(textLabel)
        NSLayoutConstraint.activate([
            textLabel.leadingAnchor.constraint(equalTo: loadingView.leadingAnchor, constant: 0),
            loadingView.trailingAnchor.constraint(equalTo: textLabel.trailingAnchor, constant: 0),
            loadingView.bottomAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 5)
        ])
    }
    
    private func show(onView : UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        onView.addSubview(self)
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: onView.safeAreaLayoutGuide.topAnchor),
            leadingAnchor.constraint(equalTo: onView.leadingAnchor),
            onView.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: bottomAnchor),
            onView.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        activityIndicatorView.startAnimating()
    }
    
    private func remove() {
        activityIndicatorView.stopAnimating()
        
        if self.superview != nil {
            self.removeFromSuperview()
        }
    }
}
