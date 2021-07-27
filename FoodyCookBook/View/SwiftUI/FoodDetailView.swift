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

    @EnvironmentObject var meal: Meal
    @State var showPopUp = false
    var mode: Mode = .live
    var action: ((FoodDetailView, Meal, Bool) -> Void)?

    private var foodImage: some View {

        VStack {
            if let foodItem = meal {
                if mode == .live {
                    AsyncImage(with: foodItem.strMealThumb,
                               andSize: .full)
                        .frame(width: UIScreen.main.bounds.width / 1.05,
                               height: UIScreen.main.bounds.height / 2.8)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Rectangle())
                        .cornerRadius(20.0)

                } else {
                    Image("recipe-placeholder")
                        .frame(width: UIScreen.main.bounds.width / 1.05,
                               height: UIScreen.main.bounds.height / 2.8)
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Rectangle())
                        .cornerRadius(20.0)
                }
            } else {
                Image("recipe-placeholder")
                    .frame(width: UIScreen.main.bounds.width / 1.05,
                           height: UIScreen.main.bounds.height / 2.8)
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
                HeaderView(title: "Meal of the day")
                    .frame(width: UIScreen.main.bounds.width / 1.1, height: 40)
                foodImage
                    .overlay(TextOverlay(titleText: "\(unwrappedMeal.strMeal)",
                                         subTitleText: "\(unwrappedMeal.strCategory)"))

                DescriptionView(title: "\(unwrappedMeal.strArea) cuisine",
                                isFavourite: unwrappedMeal.isFavourite) { flag in
                    action?(self, unwrappedMeal, flag)
                }
                .frame(width: UIScreen.main.bounds.width / 1.1, height: 60)

                ListView()

                if showPopUp {
                    CustomAlert(title: "Done",
                                message: "",
                                shouldShowPopUp: $showPopUp)
                        .offset(x: 0, y: -100)
                }

            } else {
                Text("Loading")
            }
        }
    }

    func showAlert() {
        self.showPopUp = true
    }

    func dismissPopUp() {
        self.showPopUp = false
    }
}

struct TextOverlay: View {
    var titleText: String
    var subTitleText: String

    var gradient: LinearGradient {
        LinearGradient(gradient: Gradient(
                        colors: [Color.black.opacity(0.6), Color.black.opacity(0)]), startPoint: .bottom, endPoint: .center)
    }

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Rectangle().fill(gradient)
            VStack(alignment: .leading) {
                Text("\(titleText)")
                    .font(.title)
                    .bold()
                Text(subTitleText)
            }
            .padding()
        }
        .foregroundColor(.white)
    }
}

struct FoodDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FoodDetailView(mode: .stub).environmentObject(Food.mock.meals.first!)
    }
}
