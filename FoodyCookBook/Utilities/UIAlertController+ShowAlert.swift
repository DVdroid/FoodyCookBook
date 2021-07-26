//
//  UIAlertController+ShowAlert.swift
//  FoodyCookBook
//
//  Created by Vikash Anand on 27/07/21.
//

import UIKit

extension UIAlertController {
    class func showOkAlert(in parentViewController: UIViewController,
                     with title: String,
                     and message: String) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction.init(title: "Ok", style: .default) { _ in }
        alertVC.addAction(okAction)
        parentViewController.present(alertVC, animated: true, completion: nil)
    }
}
