//
//  ViewController.swift
//  FoodyCookBook
//
//  Created by Vikash Anand on 25/07/21.
//

import UIKit
import SwiftUI

final class FoodViewController: UIViewController, StoryboardIdentifiable {

    private let loadingIndicator = LoadingIndicator()
    private var api = FoodAPI.getRandomFood

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        registerForAppStateNotifications()
        fetchRandomFood()
    }

    private func registerForAppStateNotifications() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(forName: UIApplication.willEnterForegroundNotification,
                                       object: nil, queue: .main) { (notification) in
                                        self.handleAppWillBecomeActive(notification: notification) }
        notificationCenter.addObserver(forName: UIApplication.willResignActiveNotification,
                                       object: nil, queue: .main) { (notification) in
                                        self.handleAppWillResignActive(notification: notification) }
    }

    private func handleAppWillBecomeActive(notification: Notification) { fetchRandomFood() }
    private func handleAppWillResignActive(notification: Notification) { loadingIndicator.state = .stop }

    private func fetchRandomFood() {
        loadingIndicator.state = .start(inView: view)

        NetworkManager.request(endpoint: api) { [weak self] (result: Result<Food, Error>?) in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.loadingIndicator.state = .stop

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
        guard let meal = food.meals.first else { return }

        let foodDetailView = UIHostingController(rootView: FoodDetailView() { (foodDetailView, selectedMeal, _) in
            if !selectedMeal.isAlreadyFavourite {
                let isSaved = StorageManager.shared.save(meal: selectedMeal)
                if isSaved {
                    foodDetailView.showAlert()
                }
            } else {
                let isSaved = StorageManager.shared.remove(meal: selectedMeal)
                if isSaved {
                    foodDetailView.showAlert()
                }
            }
        }.environmentObject(meal))
        
        add(foodDetailView)
        view.setupConstraintsFromAllSides(with: foodDetailView.view)
    }
}

