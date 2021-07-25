//
//  Meals.swift
//  FoodyCookBook
//
//  Created by Vikash Anand on 25/07/21.
//

import Foundation

final class Food: Decodable {
    let meals: [Meal]
    init(with meals: [Meal]) { self.meals = meals }
}

extension Food {

    static var mock: Food {
        let ingredient1 = Ingredient(ingredient: "Digestive Biscuits", measure: "250g")
        let ingredient2 = Ingredient(ingredient: "Pretzels", measure: "75g")
        let ingredient3 = Ingredient(ingredient: "Butter", measure: "135g")
        let ingredient4 = Ingredient(ingredient: "Cream Cheese", measure: "450g")
        let ingredient5 = Ingredient(ingredient: "Vanilla Extract", measure: "1tsp")

        let meal = Meal(ingredients: [ingredient1, ingredient2, ingredient3, ingredient4, ingredient5],
                             idMeal: "52833",
                             strMeal: "Salted Caramel Cheescake",
                             strDrinkAlternate: nil,
                             strCategory: "Dessert",
                             strArea: "American",
                             strInstructions: "Blitz the biscuits and the pretzels in a food processor and mix the biscuits with the melted butter",
                             strMealThumb: "https://www.themealdb.com/images/media/meals/xqrwyr1511133646.jpg",
                             strTags: nil,
                             strYoutube: "https://www.youtube.com/watch?v=q5dQp3qpmI4",
                             strIngredient1: "Digestive Biscuits",
                             strIngredient2: "Pretzels",
                             strIngredient3: "Butter",
                             strIngredient4: "Cream Cheese",
                             strIngredient5: "Vanilla Extract",
                             strIngredient6: "",
                             strIngredient7: "",
                             strIngredient8: "",
                             strIngredient9: "",
                             strIngredient10: "",
                             strIngredient11: "",
                             strIngredient12: "",
                             strIngredient13: "",
                             strIngredient14: "",
                             strIngredient15: "",
                             strIngredient16: "",
                             strIngredient17: "",
                             strIngredient18: "",
                             strIngredient19: "",
                             strIngredient20: "",
                             strMeasure1: "250g",
                             strMeasure2: "75g",
                             strMeasure3: "135g",
                             strMeasure4: "450g",
                             strMeasure5: "1tsp",
                             strMeasure6: "",
                             strMeasure7: "",
                             strMeasure8: "",
                             strMeasure9: "",
                             strMeasure10: "",
                             strMeasure11: "",
                             strMeasure12: "",
                             strMeasure13: "",
                             strMeasure14: "",
                             strMeasure15: "",
                             strMeasure16: "",
                             strMeasure17: "",
                             strMeasure18: "",
                             strMeasure19: "",
                             strMeasure20: "",
                             strSource: "http://www.janespatisserie.com/2015/11/09/no-bake-salted-caramel-cheesecake/",
                             strImageSource: nil,
                             strCreativeCommonsConfirmed: nil,
                             dateModified: nil)

        return Food(with: [meal])
    }
}

struct Meal {

    private(set) var ingredients: [Ingredient]

    let idMeal: String
    let strMeal: String
    let strDrinkAlternate: String?
    let strCategory: String
    let strArea: String
    let strInstructions: String
    let strMealThumb: String
    let strTags: String?
    let strYoutube: String
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    let strIngredient8: String?
    let strIngredient9: String?
    let strIngredient10: String?
    let strIngredient11: String?
    let strIngredient12: String?
    let strIngredient13: String?
    let strIngredient14: String?
    let strIngredient15: String?
    let strIngredient16: String?
    let strIngredient17: String?
    let strIngredient18: String?
    let strIngredient19: String?
    let strIngredient20: String?
    let strMeasure1: String?
    let strMeasure2: String?
    let strMeasure3: String?
    let strMeasure4: String?
    let strMeasure5: String?
    let strMeasure6: String?
    let strMeasure7: String?
    let strMeasure8: String?
    let strMeasure9: String?
    let strMeasure10: String?
    let strMeasure11: String?
    let strMeasure12: String?
    let strMeasure13: String?
    let strMeasure14: String?
    let strMeasure15: String?
    let strMeasure16: String?
    let strMeasure17: String?
    let strMeasure18: String?
    let strMeasure19: String?
    let strMeasure20: String?
    let strSource: String?
    let strImageSource: String?
    let strCreativeCommonsConfirmed: String?
    let dateModified: String?

    enum CodingKeys: String, CodingKey {
        case idMeal
        case strMeal
        case strDrinkAlternate
        case strCategory
        case strArea
        case strInstructions
        case strMealThumb
        case strTags
        case strYoutube
        case strIngredient1
        case strIngredient2
        case strIngredient3
        case strIngredient4
        case strIngredient5
        case strIngredient6
        case strIngredient7
        case strIngredient8
        case strIngredient9
        case strIngredient10
        case strIngredient11
        case strIngredient12
        case strIngredient13
        case strIngredient14
        case strIngredient15
        case strIngredient16
        case strIngredient17
        case strIngredient18
        case strIngredient19
        case strIngredient20
        case strMeasure1
        case strMeasure2
        case strMeasure3
        case strMeasure4
        case strMeasure5
        case strMeasure6
        case strMeasure7
        case strMeasure8
        case strMeasure9
        case strMeasure10
        case strMeasure11
        case strMeasure12
        case strMeasure13
        case strMeasure14
        case strMeasure15
        case strMeasure16
        case strMeasure17
        case strMeasure18
        case strMeasure19
        case strMeasure20
        case strSource
        case strImageSource
        case strCreativeCommonsConfirmed
        case dateModified
    }
}

extension Meal: Decodable {

    init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)
        var tempIngredients = [Ingredient]()

        idMeal = try container.decode(String.self, forKey: .idMeal)
        strMeal = try container.decode(String.self, forKey: .strMeal)
        strDrinkAlternate = try container.decodeIfPresent(String.self, forKey: .strDrinkAlternate)
        strCategory = try container.decode(String.self, forKey: .strCategory)
        strArea = try container.decode(String.self, forKey: .strArea)
        strInstructions = try container.decode(String.self, forKey: .strInstructions)
        strMealThumb = try container.decode(String.self, forKey: .strMealThumb)
        strTags = try container.decodeIfPresent(String.self, forKey: .strTags)
        strYoutube = try container.decode(String.self, forKey: .strYoutube)
        strIngredient1 = try container.decodeIfPresent(String.self, forKey: .strIngredient1)
        strIngredient2 = try container.decodeIfPresent(String.self, forKey: .strIngredient2)
        strIngredient3 = try container.decodeIfPresent(String.self, forKey: .strIngredient3)
        strIngredient4 = try container.decodeIfPresent(String.self, forKey: .strIngredient4)
        strIngredient5 = try container.decodeIfPresent(String.self, forKey: .strIngredient5)
        strIngredient6 = try container.decodeIfPresent(String.self, forKey: .strIngredient6)
        strIngredient7 = try container.decodeIfPresent(String.self, forKey: .strIngredient7)
        strIngredient8 = try container.decodeIfPresent(String.self, forKey: .strIngredient8)
        strIngredient9 = try container.decodeIfPresent(String.self, forKey: .strIngredient9)
        strIngredient10 = try container.decodeIfPresent(String.self, forKey: .strIngredient10)
        strIngredient11 = try container.decodeIfPresent(String.self, forKey: .strIngredient11)
        strIngredient12 = try container.decodeIfPresent(String.self, forKey: .strIngredient12)
        strIngredient13 = try container.decodeIfPresent(String.self, forKey: .strIngredient13)
        strIngredient14 = try container.decodeIfPresent(String.self, forKey: .strIngredient14)
        strIngredient15 = try container.decodeIfPresent(String.self, forKey: .strIngredient15)
        strIngredient16 = try container.decodeIfPresent(String.self, forKey: .strIngredient16)
        strIngredient17 = try container.decodeIfPresent(String.self, forKey: .strIngredient17)
        strIngredient18 = try container.decodeIfPresent(String.self, forKey: .strIngredient18)
        strIngredient19 = try container.decodeIfPresent(String.self, forKey: .strIngredient19)
        strIngredient20 = try container.decodeIfPresent(String.self, forKey: .strIngredient20)
        strMeasure1 = try container.decodeIfPresent(String.self, forKey: .strMeasure1)
        strMeasure2 = try container.decodeIfPresent(String.self, forKey: .strMeasure2)
        strMeasure3 = try container.decodeIfPresent(String.self, forKey: .strMeasure3)
        strMeasure4 = try container.decodeIfPresent(String.self, forKey: .strMeasure4)
        strMeasure5 = try container.decodeIfPresent(String.self, forKey: .strMeasure5)
        strMeasure6 = try container.decodeIfPresent(String.self, forKey: .strMeasure6)
        strMeasure7 = try container.decodeIfPresent(String.self, forKey: .strMeasure7)
        strMeasure8 = try container.decodeIfPresent(String.self, forKey: .strMeasure8)
        strMeasure9 = try container.decodeIfPresent(String.self, forKey: .strMeasure9)
        strMeasure10 = try container.decodeIfPresent(String.self, forKey: .strMeasure10)
        strMeasure11 = try container.decodeIfPresent(String.self, forKey: .strMeasure11)
        strMeasure12 = try container.decodeIfPresent(String.self, forKey: .strMeasure12)
        strMeasure13 = try container.decodeIfPresent(String.self, forKey: .strMeasure13)
        strMeasure14 = try container.decodeIfPresent(String.self, forKey: .strMeasure14)
        strMeasure15 = try container.decodeIfPresent(String.self, forKey: .strMeasure15)
        strMeasure16 = try container.decodeIfPresent(String.self, forKey: .strMeasure16)
        strMeasure17 = try container.decodeIfPresent(String.self, forKey: .strMeasure17)
        strMeasure18 = try container.decodeIfPresent(String.self, forKey: .strMeasure18)
        strMeasure19 = try container.decodeIfPresent(String.self, forKey: .strMeasure19)
        strMeasure20 = try container.decodeIfPresent(String.self, forKey: .strMeasure20)
        strSource = try container.decodeIfPresent(String.self, forKey: .strSource)
        strImageSource = try container.decodeIfPresent(String.self, forKey: .strImageSource)
        strCreativeCommonsConfirmed = try container.decodeIfPresent(String.self, forKey: .strCreativeCommonsConfirmed)
        dateModified = try container.decodeIfPresent(String.self, forKey: .dateModified)

        let ingredient1 = Ingredient(ingredient: strIngredient1, measure: strMeasure1)
        if !ingredient1.isEmpty { tempIngredients.append(ingredient1) }

        let ingredient2 = Ingredient(ingredient: strIngredient2, measure: strMeasure2)
        if !ingredient2.isEmpty { tempIngredients.append(ingredient2) }

        let ingredient3 = Ingredient(ingredient: strIngredient3, measure: strMeasure3)
        if !ingredient3.isEmpty { tempIngredients.append(ingredient3) }

        let ingredient4 = Ingredient(ingredient: strIngredient4, measure: strMeasure4)
        if !ingredient4.isEmpty { tempIngredients.append(ingredient4) }

        let ingredient5 = Ingredient(ingredient: strIngredient5, measure: strMeasure5)
        if !ingredient5.isEmpty { tempIngredients.append(ingredient5) }

        let ingredient6 = Ingredient(ingredient: strIngredient6, measure: strMeasure6)
        if !ingredient6.isEmpty { tempIngredients.append(ingredient6) }

        let ingredient7 = Ingredient(ingredient: strIngredient7, measure: strMeasure7)
        if !ingredient7.isEmpty { tempIngredients.append(ingredient7) }

        let ingredient8 = Ingredient(ingredient: strIngredient8, measure: strMeasure8)
        if !ingredient8.isEmpty { tempIngredients.append(ingredient8) }

        let ingredient9 = Ingredient(ingredient: strIngredient9, measure: strMeasure9)
        if !ingredient9.isEmpty { tempIngredients.append(ingredient9) }

        let ingredient10 = Ingredient(ingredient: strIngredient10, measure: strMeasure10)
        if !ingredient10.isEmpty { tempIngredients.append(ingredient10) }

        let ingredient11 = Ingredient(ingredient: strIngredient11, measure: strMeasure11)
        if !ingredient11.isEmpty { tempIngredients.append(ingredient11) }

        let ingredient12 = Ingredient(ingredient: strIngredient12, measure: strMeasure12)
        if !ingredient12.isEmpty { tempIngredients.append(ingredient12) }

        let ingredient13 = Ingredient(ingredient: strIngredient13, measure: strMeasure13)
        if !ingredient13.isEmpty { tempIngredients.append(ingredient13) }

        let ingredient14 = Ingredient(ingredient: strIngredient14, measure: strMeasure14)
        if !ingredient14.isEmpty { tempIngredients.append(ingredient14) }

        let ingredient15 = Ingredient(ingredient: strIngredient15, measure: strMeasure15)
        if !ingredient15.isEmpty { tempIngredients.append(ingredient15) }

        let ingredient16 = Ingredient(ingredient: strIngredient16, measure: strMeasure16)
        if !ingredient16.isEmpty { tempIngredients.append(ingredient16) }

        let ingredient17 = Ingredient(ingredient: strIngredient17, measure: strMeasure17)
        if !ingredient17.isEmpty { tempIngredients.append(ingredient17) }

        let ingredient18 = Ingredient(ingredient: strIngredient18, measure: strMeasure18)
        if !ingredient18.isEmpty { tempIngredients.append(ingredient18) }

        let ingredient19 = Ingredient(ingredient: strIngredient19, measure: strMeasure19)
        if !ingredient19.isEmpty { tempIngredients.append(ingredient19) }

        let ingredient20 = Ingredient(ingredient: strIngredient20, measure: strMeasure20)
        if !ingredient20.isEmpty { tempIngredients.append(ingredient20) }

        ingredients = tempIngredients
    }

    private func ingredient(from name: String, measure: String) -> Ingredient? {
        guard !name.isEmpty && !measure.isEmpty else {
            return nil
        }
        return Ingredient(ingredient: name, measure: measure)
    }
}

extension Meal: CustomDebugStringConvertible {
    var debugDescription: String {
        return "\(idMeal), \(strMeal), \(strArea), \(ingredients)"
    }
}


struct Ingredient: Decodable {
    private(set) var ingredientID = UUID()
    let ingredient: String?
    let measure: String?

    var isEmpty: Bool {
        (ingredient?.isEmpty ?? true && measure?.isEmpty ?? true)
    }
}



