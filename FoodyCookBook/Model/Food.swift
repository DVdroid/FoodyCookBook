//
//  Meals.swift
//  FoodyCookBook
//
//  Created by Vikash Anand on 25/07/21.
//

import Foundation

final class Food: Codable {
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
                             strMeal: "Salted Caramel Cheesecake",
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

final class Meal: Codable, ObservableObject {

    var savedMeals: [Meal]? { try? FilesManager.shared.loadJSON() }
    var isAlreadyFavourite: Bool {
        guard let unwrappedSavedMeals = savedMeals else { return false }
        return !unwrappedSavedMeals.filter { $0.idMeal == idMeal }.isEmpty
    }

    private(set) var ingredients: [Ingredient]
    @Published var isFavourite: Bool = false

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
        case isFavourite
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

    required init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)
        var tempIngredients = [Ingredient]()

        if container.contains(.isFavourite) {
            isFavourite = try container.decode(Bool.self, forKey: .isFavourite)
        } else {
            isFavourite = false
        }

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

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(isFavourite, forKey: .isFavourite)
        try container.encode(idMeal, forKey: .idMeal)
        try container.encode(strMeal, forKey: .strMeal)
        try container.encodeIfPresent(strDrinkAlternate, forKey: .strDrinkAlternate)
        try container.encode(strCategory, forKey: .strCategory)
        try container.encode(strArea, forKey: .strArea)
        try container.encode(strInstructions, forKey: .strInstructions)
        try container.encode(strMealThumb, forKey: .strMealThumb)
        try container.encodeIfPresent(strTags, forKey: .strTags)
        try container.encode(strYoutube, forKey: .strYoutube)
        try container.encodeIfPresent(strIngredient1, forKey: .strIngredient1)
        try container.encodeIfPresent(strIngredient2, forKey: .strIngredient2)
        try container.encodeIfPresent(strIngredient3, forKey: .strIngredient3)
        try container.encodeIfPresent(strIngredient4, forKey: .strIngredient4)
        try container.encodeIfPresent(strIngredient5, forKey: .strIngredient5)
        try container.encodeIfPresent(strIngredient6, forKey: .strIngredient6)
        try container.encodeIfPresent(strIngredient7, forKey: .strIngredient7)
        try container.encodeIfPresent(strIngredient8, forKey: .strIngredient8)
        try container.encodeIfPresent(strIngredient9, forKey: .strIngredient9)
        try container.encodeIfPresent(strIngredient10, forKey: .strIngredient10)
        try container.encodeIfPresent(strIngredient11, forKey: .strIngredient11)
        try container.encodeIfPresent(strIngredient12, forKey: .strIngredient12)
        try container.encodeIfPresent(strIngredient13, forKey: .strIngredient13)
        try container.encodeIfPresent(strIngredient14, forKey: .strIngredient14)
        try container.encodeIfPresent(strIngredient15, forKey: .strIngredient15)
        try container.encodeIfPresent(strIngredient16, forKey: .strIngredient16)
        try container.encodeIfPresent(strIngredient17, forKey: .strIngredient17)
        try container.encodeIfPresent(strIngredient18, forKey: .strIngredient18)
        try container.encodeIfPresent(strIngredient19, forKey: .strIngredient19)
        try container.encodeIfPresent(strIngredient20, forKey: .strIngredient20)
        try container.encodeIfPresent(strMeasure1, forKey: .strMeasure1)
        try container.encodeIfPresent(strMeasure2, forKey: .strMeasure2)
        try container.encodeIfPresent(strMeasure3, forKey: .strMeasure3)
        try container.encodeIfPresent(strMeasure4, forKey: .strMeasure4)
        try container.encodeIfPresent(strMeasure5, forKey: .strMeasure5)
        try container.encodeIfPresent(strMeasure6, forKey: .strMeasure6)
        try container.encodeIfPresent(strMeasure7, forKey: .strMeasure7)
        try container.encodeIfPresent(strMeasure8, forKey: .strMeasure8)
        try container.encodeIfPresent(strMeasure9, forKey: .strMeasure9)
        try container.encodeIfPresent(strMeasure10, forKey: .strMeasure10)
        try container.encodeIfPresent(strMeasure11, forKey: .strMeasure11)
        try container.encodeIfPresent(strMeasure12, forKey: .strMeasure12)
        try container.encodeIfPresent(strMeasure13, forKey: .strMeasure13)
        try container.encodeIfPresent(strMeasure14, forKey: .strMeasure14)
        try container.encodeIfPresent(strMeasure15, forKey: .strMeasure15)
        try container.encodeIfPresent(strMeasure16, forKey: .strMeasure16)
        try container.encodeIfPresent(strMeasure17, forKey: .strMeasure17)
        try container.encodeIfPresent(strMeasure18, forKey: .strMeasure18)
        try container.encodeIfPresent(strMeasure19, forKey: .strMeasure19)
        try container.encodeIfPresent(strMeasure20, forKey: .strMeasure20)
        try container.encodeIfPresent(strSource, forKey: .strSource)
        try container.encodeIfPresent(strImageSource, forKey: .strImageSource)
        try container.encodeIfPresent(strCreativeCommonsConfirmed, forKey: .strCreativeCommonsConfirmed)
        try container.encodeIfPresent(dateModified, forKey: .dateModified)
    }

    internal init(isFavourite: Bool = false, ingredients: [Ingredient], idMeal: String, strMeal: String, strDrinkAlternate: String?, strCategory: String, strArea: String, strInstructions: String, strMealThumb: String, strTags: String?, strYoutube: String, strIngredient1: String?, strIngredient2: String?, strIngredient3: String?, strIngredient4: String?, strIngredient5: String?, strIngredient6: String?, strIngredient7: String?, strIngredient8: String?, strIngredient9: String?, strIngredient10: String?, strIngredient11: String?, strIngredient12: String?, strIngredient13: String?, strIngredient14: String?, strIngredient15: String?, strIngredient16: String?, strIngredient17: String?, strIngredient18: String?, strIngredient19: String?, strIngredient20: String?, strMeasure1: String?, strMeasure2: String?, strMeasure3: String?, strMeasure4: String?, strMeasure5: String?, strMeasure6: String?, strMeasure7: String?, strMeasure8: String?, strMeasure9: String?, strMeasure10: String?, strMeasure11: String?, strMeasure12: String?, strMeasure13: String?, strMeasure14: String?, strMeasure15: String?, strMeasure16: String?, strMeasure17: String?, strMeasure18: String?, strMeasure19: String?, strMeasure20: String?, strSource: String?, strImageSource: String?, strCreativeCommonsConfirmed: String?, dateModified: String?) {
        self.isFavourite = isFavourite
        self.ingredients = ingredients
        self.idMeal = idMeal
        self.strMeal = strMeal
        self.strDrinkAlternate = strDrinkAlternate
        self.strCategory = strCategory
        self.strArea = strArea
        self.strInstructions = strInstructions
        self.strMealThumb = strMealThumb
        self.strTags = strTags
        self.strYoutube = strYoutube
        self.strIngredient1 = strIngredient1
        self.strIngredient2 = strIngredient2
        self.strIngredient3 = strIngredient3
        self.strIngredient4 = strIngredient4
        self.strIngredient5 = strIngredient5
        self.strIngredient6 = strIngredient6
        self.strIngredient7 = strIngredient7
        self.strIngredient8 = strIngredient8
        self.strIngredient9 = strIngredient9
        self.strIngredient10 = strIngredient10
        self.strIngredient11 = strIngredient11
        self.strIngredient12 = strIngredient12
        self.strIngredient13 = strIngredient13
        self.strIngredient14 = strIngredient14
        self.strIngredient15 = strIngredient15
        self.strIngredient16 = strIngredient16
        self.strIngredient17 = strIngredient17
        self.strIngredient18 = strIngredient18
        self.strIngredient19 = strIngredient19
        self.strIngredient20 = strIngredient20
        self.strMeasure1 = strMeasure1
        self.strMeasure2 = strMeasure2
        self.strMeasure3 = strMeasure3
        self.strMeasure4 = strMeasure4
        self.strMeasure5 = strMeasure5
        self.strMeasure6 = strMeasure6
        self.strMeasure7 = strMeasure7
        self.strMeasure8 = strMeasure8
        self.strMeasure9 = strMeasure9
        self.strMeasure10 = strMeasure10
        self.strMeasure11 = strMeasure11
        self.strMeasure12 = strMeasure12
        self.strMeasure13 = strMeasure13
        self.strMeasure14 = strMeasure14
        self.strMeasure15 = strMeasure15
        self.strMeasure16 = strMeasure16
        self.strMeasure17 = strMeasure17
        self.strMeasure18 = strMeasure18
        self.strMeasure19 = strMeasure19
        self.strMeasure20 = strMeasure20
        self.strSource = strSource
        self.strImageSource = strImageSource
        self.strCreativeCommonsConfirmed = strCreativeCommonsConfirmed
        self.dateModified = dateModified
    }
}

extension Meal: CustomDebugStringConvertible {
    var debugDescription: String {
        return "\(idMeal), \(strMeal), \(strArea), \(ingredients)"
    }
}

struct Ingredient: Codable {
    private(set) var ingredientID = UUID()
    let ingredient: String?
    let measure: String?

    var isEmpty: Bool {
        (ingredient?.trimmingCharacters(in: .whitespaces).isEmpty ?? true &&
            measure?.trimmingCharacters(in: .whitespaces).isEmpty ?? true)
    }
}



