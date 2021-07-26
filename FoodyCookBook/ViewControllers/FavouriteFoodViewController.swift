//
//  FavouriteFoodViewController.swift
//  FoodyCookBook
//
//  Created by Vikash Anand on 25/07/21.
//

import UIKit
import SwiftUI

final class FavouriteFoodViewController: UIViewController, StoryboardIdentifiable {

    private let loadingIndicator = LoadingIndicator()
    private(set) lazy var favouriteMealsTableView: UITableView = {
        let tableview = UITableView()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        let cellNib = UINib(nibName: "MealTableViewCell", bundle: .main)
        tableview.register(cellNib, forCellReuseIdentifier: "mealcell")
        return tableview
    }()

    private lazy var noSavedMealLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.text = "No saved meals"
        return label
    }()

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("required init?(coder: NSCoder)")
    }

    private(set) var favouriteMeals: [Meal]
    init(with meals: [Meal]) {
        self.favouriteMeals = meals
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        setupSubView()
        configureTableView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.favouriteMealsTableView.isHidden = false
        loadSaveMeals()
    }

    private func loadSaveMeals() {
        guard let savedMeals: [Meal] = try? FilesManager.shared.loadJSON() else {
            self.favouriteMealsTableView.isHidden = true
            return
        }
        self.favouriteMeals = savedMeals
        self.favouriteMealsTableView.reloadData()
    }
    
    private func setupSubView() {
        view.addSubview(noSavedMealLabel)
        view.setupConstraintsAtCenter(with: noSavedMealLabel)
        view.addSubview(favouriteMealsTableView)
        view.setupConstraintsFromAllSides(with: favouriteMealsTableView)
    }

    private func configureTableView() {
        favouriteMealsTableView.dataSource = self
        favouriteMealsTableView.delegate = self
        favouriteMealsTableView.tableFooterView = UIView()
    }
}

extension FavouriteFoodViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        favouriteMeals.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "mealcell") as? MealTableViewCell else {
            return UITableViewCell()
        }

        let unwrappedMeal = favouriteMeals[indexPath.row]
        cell.thumbnailImageView.loadImageFromURL(urlString: unwrappedMeal.strMealThumb,
                                                 targetSize: CGSize(width: 80, height: 80)) { status in
        }

        cell.headerLabel.text = unwrappedMeal.strMeal
        cell.subHeaderLabel.text = unwrappedMeal.strCategory
        return cell
    }
}

extension FavouriteFoodViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let unwrappedMeal = favouriteMeals[indexPath.row]
        let foodDetailView = UIHostingController(rootView: FoodDetailView(meal: unwrappedMeal))
        self.present(foodDetailView, animated: true, completion: nil)
    }
}
