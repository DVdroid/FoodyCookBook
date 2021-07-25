//
//  SearchFoodViewController.swift
//  FoodyCookBook
//
//  Created by Vikash Anand on 25/07/21.
//

import UIKit

final class SearchFoodViewController: UITableViewController, StoryboardIdentifiable {
    var loadingIndicator: LoadingIndicator?
    var api = FoodAPI.getFood

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadingIndicator?.state = .start(inView: view)
    }
}
