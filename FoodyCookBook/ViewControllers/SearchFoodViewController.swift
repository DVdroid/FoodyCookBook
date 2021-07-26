//
//  SearchFoodViewController.swift
//  FoodyCookBook
//
//  Created by Vikash Anand on 25/07/21.
//

import UIKit
import SwiftUI

final class SearchFoodViewController: UIViewController, StoryboardIdentifiable {

    private var searchTask: DispatchWorkItem?
    private let loadingIndicator = LoadingIndicator()
    let searchController = UISearchController(searchResultsController: nil)

    private(set) lazy var mealsTableView: UITableView = {
        let tableview = UITableView()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        let cellNib = UINib(nibName: "MealTableViewCell", bundle: .main)
        tableview.register(cellNib, forCellReuseIdentifier: "mealcell")
        return tableview
    }()

    private lazy var noResultLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.text = "No result found"
        return label
    }()

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("required init?(coder: NSCoder)")
    }

    private(set) var meals: [Meal]
    init(with meals: [Meal]) {
        self.meals = meals
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        setupSubView()
        configureTableView()
        configureSearchBar()
    }

    private func setupSubView() {
        view.addSubview(noResultLabel)
        view.setupConstraintsAtCenter(with: noResultLabel)
        view.addSubview(mealsTableView)
        view.setupConstraintsFromAllSides(with: mealsTableView)
    }

    private func configureTableView() {
        mealsTableView.dataSource = self
        mealsTableView.delegate = self
        mealsTableView.tableFooterView = UIView()
    }

    private func configureSearchBar(){
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Meals"
        mealsTableView.tableHeaderView = searchController.searchBar
        definesPresentationContext = true
    }

    func filterContentForSearchText(_ searchText: String) {
        mealsTableView.reloadData()
    }
}

extension SearchFoodViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        meals.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "mealcell") as? MealTableViewCell else {
            return UITableViewCell()
        }

        let unwrappedMeal = meals[indexPath.row]
        cell.thumbnailImageView.loadImageFromURL(urlString: unwrappedMeal.strMealThumb,
                                                 targetSize: CGSize(width: 80, height: 80)) { status in
        }

        cell.headerLabel.text = unwrappedMeal.strMeal
        cell.subHeaderLabel.text = unwrappedMeal.strCategory
        return cell
    }
}

extension SearchFoodViewController: UISearchResultsUpdating {

    func updateSearchResults(for searchController: UISearchController) {

        self.mealsTableView.isHidden = false
        guard let searchText = searchController.searchBar.text,
              !searchText.isEmpty else {
            meals.removeAll()
            mealsTableView.reloadData()
            return
        }

        self.searchTask?.cancel()
        let task = DispatchWorkItem { [weak self] in

            self?.loadingIndicator.state = .start(inView: self?.view)
            NetworkManager.request(endpoint: FoodAPI.getFood(searchText: searchText)) { [weak self] (result: Result<Food, Error>?) in

                DispatchQueue.main.async {
                    self?.loadingIndicator.state = .stop
                    do {
                        if let unwrappedMeals = try result?.get().meals {
                            self?.meals = unwrappedMeals
                            self?.mealsTableView.reloadData()
                        }
                    } catch (let error){
                        self?.mealsTableView.isHidden = true
                        print(error.localizedDescription)
                    }
                }
            }
        }

        self.searchTask = task
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5, execute: task)
    }
}

extension SearchFoodViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let unwrappedMeal = meals[indexPath.row]
        let foodDetailView = UIHostingController(rootView: FoodDetailView(meal: unwrappedMeal))
        self.present(foodDetailView, animated: true, completion: nil)
    }
}
