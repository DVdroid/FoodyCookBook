//
//  DescriptionView.swift
//  FoodyCookBook
//
//  Created by Vikash Anand on 26/07/21.
//

import SwiftUI

struct DescriptionView: View {

    @EnvironmentObject var meal: Meal
    var title: String
    var isFavourite: Bool
    var action: ((Bool) -> Void)?

    var body: some View {
        HStack {
            VStack {
                Text("\(title)")
                    .frame(width: UIScreen.main.bounds.width / 1.4,
                           height: 20,
                           alignment: .leading)
                    .font(.body)
                    .foregroundColor(.secondary)
                
            }

            if let unwrappedAction = action {
                FavouriteButton(isSet: $meal.isFavourite){ flag in
                    unwrappedAction(flag)
                }
            }
        }
    }
}

struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionView(title: "Title",
                        isFavourite: true)
    }
}
