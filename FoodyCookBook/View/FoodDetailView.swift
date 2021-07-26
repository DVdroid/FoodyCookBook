//
//  FoodDetailView.swift
//  FoodyCookBook
//
//  Created by Vikash Anand on 25/07/21.
//

import SwiftUI

struct FoodDetailView: View {

    enum Mode {
        case live
        case stub
    }

    var mode: Mode = .live
    @State var food: Food
    private var meal: Meal? {
        food.meals.first
    }

    private var foodImage: some View {

        VStack {
            if let foodItem = food.meals.first {
                if mode == .live {
                    AsyncImage(with: foodItem.strMealThumb,
                               andSize: .full)
                        .frame(width: UIScreen.main.bounds.width / 1.1,
                               height: UIScreen.main.bounds.height / 2.5)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Rectangle())
                        .cornerRadius(20.0)

                } else {
                    Image("recipe-placeholder")
                        .frame(width: UIScreen.main.bounds.width / 1.1,
                               height: UIScreen.main.bounds.height / 2.5)
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Rectangle())
                        .cornerRadius(20.0)
                }
            } else {
                Image("recipe-placeholder")
                    .frame(width: UIScreen.main.bounds.width / 1.1,
                           height: UIScreen.main.bounds.height / 2.5)
                    .background(Color.gray)
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Rectangle())
                    .cornerRadius(20.0)
            }
        }

    }

    var body: some View {
        VStack {
            if let unwrappedMeal = meal {
                HeaderView(title: "Meal of the day",
                           subTitle: "\(unwrappedMeal.strArea) cuisine")
                foodImage
                DescriptionView(title: "\(unwrappedMeal.strMeal)",
                                subTitle: "\(unwrappedMeal.strCategory)") {
                    print("Marked as favourite!!!")
                }
                ListView(food: food)

            } else {
                Text("Loading")
            }
        }
    }

}

struct FoodDetailView_Previews: PreviewProvider {
    static var previews: some View {
        var foodDetailView = FoodDetailView(food: Food.mock)
        foodDetailView.mode = .stub
        return foodDetailView
    }
}
