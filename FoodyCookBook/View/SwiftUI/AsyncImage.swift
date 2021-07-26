//
//  AsyncImage.swift
//  FoodyCookBook
//
//  Created by Vikash Anand on 26/07/21.
//

import SwiftUI

struct AsyncImage: UIViewRepresentable {

    static var isAppInBackground: Bool = false
    enum SizeType {
        case full
        case thumbnail
    }

    private var loadingIndicator = LoadingIndicator(withStyle: .activityIndicator)
    private init(){ fatalError() }

    private let imageURLString: String
    private let sizeType: SizeType
    private var isAppInBackground: Bool = false

    init(with imageURLString: String, andSize sizeType: SizeType) {
        self.imageURLString = imageURLString
        self.sizeType = sizeType
        registerForAppStateNotifications()
    }

    private func registerForAppStateNotifications() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(forName: UIApplication.didBecomeActiveNotification,
                                       object: nil, queue: .main) { (notification) in
            self.handleAppDidBecomeActive(notification: notification) }
        notificationCenter.addObserver(forName: UIApplication.willResignActiveNotification,
                                       object: nil, queue: .main) { (notification) in
            self.handleAppWillResignActive(notification: notification) }
    }

    private func handleAppDidBecomeActive(notification: Notification) {
        AsyncImage.isAppInBackground = false
    }
    private func handleAppWillResignActive(notification: Notification) {
        AsyncImage.isAppInBackground = true
        loadingIndicator.state = .stop
    }

    func makeUIView(context: Context) -> UIImageView { UIImageView() }

    func updateUIView(_ imageView: UIImageView, context: Context) {
        if !AsyncImage.isAppInBackground {
            loadingIndicator.state = .start(inView: imageView)

            let targetSize: CGSize
            switch sizeType {
            case .full:
                targetSize = CGSize(width: UIScreen.main.bounds.width / 1.1,
                                    height: UIScreen.main.bounds.height / 2)
            case .thumbnail:
                targetSize = CGSize(width: 40, height: 40)
            }

            imageView.loadImageFromURL(urlString: imageURLString, targetSize: targetSize) { status in
                loadingIndicator.state = .stop
            }
        }
    }
}
