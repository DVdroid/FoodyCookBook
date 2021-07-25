//
//  AsyncImage.swift
//  FoodyCookBook
//
//  Created by Vikash Anand on 26/07/21.
//

import SwiftUI

struct AsyncImage: UIViewRepresentable {

    var imageURLString: String?
    init(with imageURLString: String) {
        self.imageURLString = imageURLString
    }

    func makeUIView(context: Context) -> UIImageView {
       let imageView = UIImageView()
        imageView.layer.cornerRadius = 5.0
        return imageView
    }

    func updateUIView(_ imageView: UIImageView, context: Context) {
        guard let unwrappedImageURL = self.imageURLString else { return }
        imageView.loadImageFromURL(urlString: unwrappedImageURL)
    }
}
