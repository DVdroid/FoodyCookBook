//
//  UIView+AutoLayout.swift
//  FoodyCookBook
//
//  Created by Vikash Anand on 26/07/21.
//

import UIKit

extension UIView {

    func setupConstraintsFromAllSides(with childView: UIView) {
        childView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            childView.topAnchor.constraint(equalTo: topAnchor),
            childView.leadingAnchor.constraint(equalTo: leadingAnchor),
            trailingAnchor.constraint(equalTo: childView.trailingAnchor),
            bottomAnchor.constraint(equalTo: childView.bottomAnchor)
        ])
    }

    func setupConstraintsAtCenter(with childView: UIView) {
        childView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            childView.centerXAnchor.constraint(equalTo: centerXAnchor),
            childView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
