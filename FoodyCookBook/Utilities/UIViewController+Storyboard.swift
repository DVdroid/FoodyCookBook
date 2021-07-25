//
//  UIStoryboard+LoadView.swift
//  FoodyCookBook
//
//  Created by Vikash Anand on 25/07/21.
//

import UIKit

extension UIViewController {
    class func loadFromStoryboard<T: UIViewController>(with name: String = "Main",
                                                       and bundle: Bundle = .main) -> T {

        let storyboard = UIStoryboard(name: name, bundle: bundle)
        guard let viewController = storyboard.instantiateViewController(identifier: String(describing: self)) as? T else {
            fatalError("ViewController named \(String(describing: T.self)) doesn't exists")
        }
        return viewController
    }
}
