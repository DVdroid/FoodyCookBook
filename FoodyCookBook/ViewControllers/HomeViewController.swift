//
//  HomeViewController.swift
//  FoodyCookBook
//
//  Created by Vikash Anand on 25/07/21.
//

import UIKit

final class HomeViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupTabs()
    }

    private func setupTabs() {
        let randomFoodVC = FoodViewController.loadFromStoryboard()
        let randomFoodTab = tabBarItem(with: "Home", and: "house")
        randomFoodVC.tabBarItem = randomFoodTab

        let searchFoodVC = SearchFoodViewController.loadFromStoryboard()
        let searchFoodTab = tabBarItem(with: "search", and: "magnifyingglass.circle")
        searchFoodVC.tabBarItem = searchFoodTab

        let favouriteFoodVC = FavouriteFoodViewController.loadFromStoryboard()
        let favouriteFoodTab = tabBarItem(with: "favourite", and: "star")
        favouriteFoodVC.tabBarItem = favouriteFoodTab

        self.viewControllers = [randomFoodVC, searchFoodVC, favouriteFoodVC]
    }

    private func tabBarItem(with title: String, and imageName: String) -> UITabBarItem {
        let tabImage = UIImage(systemName: imageName)
        return UITabBarItem(title: title,
                            image: tabImage,
                            selectedImage: nil)
    }
}

extension HomeViewController: UITabBarControllerDelegate {

}
