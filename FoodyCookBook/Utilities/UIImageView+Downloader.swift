//
//  UIImageView+Downloader.swift
//  FoodyCookBook
//
//  Created by Vikash Anand on 25/07/21.
//

import Foundation
import UIKit

let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {

    @discardableResult
    func loadImageFromURL(urlString: String,
                          placeHolder: UIImage? = nil) -> URLSessionDataTask? {
        self.image = nil
        let key = NSString(string: urlString)
        if let cacheImage = imageCache.object(forKey: key){
            self.image = cacheImage
            return nil
        }

        guard let url = URL(string: urlString) else { return nil }
        if let placeHolder = placeHolder { self.image = placeHolder }

        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            DispatchQueue.main.async {
                if let data = data,
                   let downloadImage = UIImage(data: data) {
                    imageCache.setObject(downloadImage, forKey: NSString(string: urlString))
                    self.image = downloadImage
                }
            }
        }

        task.resume()
        return task
    }

}
