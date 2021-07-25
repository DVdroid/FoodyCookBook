//
//  FoodAPI.swift
//  FoodyCookBook
//
//  Created by Vikash Anand on 25/07/21.
//

import Foundation

enum FoodAPI: API {
    case getRandomFood
    case getFood(searchText: String?)

    var scheme: HTTPScheme {
        return .https
    }

    var baseURL: String {
        return "www.themealdb.com"
    }

    var path: String {
        switch self {
        case .getRandomFood:
            return "/api/json/v1/1/random.php"
        case .getFood:
            return "/api/json/v1/1/search.php"
        }
    }

    var parameters: [URLQueryItem] {
        var params: [URLQueryItem] = []
        switch self {
        case .getFood(searchText: let searchString):
            if let searchString = searchString {
                params.append(URLQueryItem.init(name: "k", value: searchString))
            }
            return params
        default:
            return params
        }
    }

    var method: HTTPMethod { .get }
}
