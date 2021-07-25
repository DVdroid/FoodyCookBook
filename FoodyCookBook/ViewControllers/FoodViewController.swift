//
//  ViewController.swift
//  FoodyCookBook
//
//  Created by Vikash Anand on 25/07/21.
//

import UIKit
import SwiftUI

final class FoodViewController: UIViewController, StoryboardIdentifiable {

    var loadingIndicator: LoadingIndicator?
    var api = FoodAPI.getRandomFood

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadingIndicator?.state = .start(inView: view)

        fetchRandomFood()
    }

    private func fetchRandomFood() {
        NetworkManager.request(endpoint: api) { [weak self] (result: Result<Food, Error>?) in

            guard let self = self else { return }
            DispatchQueue.main.async {
                self.loadingIndicator?.state = .stop

                do {
                    if let food = try result?.get() {
                        self.showFoodDetailView(with: food)
                    }
                } catch (let error){
                    print(error.localizedDescription)
                }
            }
        }
    }

    private func showFoodDetailView(with food: Food) {
        let foodDetailView = UIHostingController(rootView: FoodDetailView(food: food))
        add(foodDetailView)
        setupConstraints(with: foodDetailView.view)
    }

    private func setupConstraints(with childView: UIView) {
        childView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            childView.topAnchor.constraint(equalTo: view.topAnchor),
            childView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: childView.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: childView.bottomAnchor)
        ])
    }
}

