//
//  ViewController.swift
//  FoodyCookBook
//
//  Created by Vikash Anand on 25/07/21.
//

import UIKit

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
        NetworkManager.request(endpoint: api) { [weak loadingIndicator] (result: Result<Food, Error>?) in

            DispatchQueue.main.async {
                loadingIndicator?.state = .stop

                do {
                    print(try result?.get() ?? "")
                } catch (let error){
                    print(error.localizedDescription)
                }
            }
        }
    }
}

