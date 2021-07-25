//
//  UIStoryboard+LoadView.swift
//  FoodyCookBook
//
//  Created by Vikash Anand on 25/07/21.
//

import UIKit

protocol StoryboardIdentifiable {
    static var storyboardIdentifier: String { get }
}

extension StoryboardIdentifiable where Self: UIViewController {
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
}

extension UIViewController {
    class func loadFromStoryboard<T: UIViewController>(with name: String = "Main") -> T  where T: StoryboardIdentifiable {

        let storyboard = UIStoryboard(name: name, bundle: Bundle(for: T.self))
        guard let viewController = storyboard.instantiateViewController(identifier: T.storyboardIdentifier) as? T else {
            fatalError("ViewController named \(String(describing: T.self)) doesn't exists")
        }
        return viewController
    }
}
