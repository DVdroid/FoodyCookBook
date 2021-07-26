//
//  AsyncImage.swift
//  FoodyCookBook
//
//  Created by Vikash Anand on 26/07/21.
//

import SwiftUI

struct AsyncImage: UIViewRepresentable {

    enum SizeType {
        case full
        case thumbnail
    }

    private var loadingIndicator = LoadingIndicator(withStyle: .activityIndicator)
    private init(){ fatalError() }

    private let imageURLString: String
    private let sizeType: SizeType
    init(with imageURLString: String, andSize sizeType: SizeType) {
        self.imageURLString = imageURLString
        self.sizeType = sizeType
    }

    func makeUIView(context: Context) -> UIImageView { UIImageView() }

    func updateUIView(_ imageView: UIImageView, context: Context) {
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
