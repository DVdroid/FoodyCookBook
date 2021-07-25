//
//  FoodDetailView.swift
//  FoodyCookBook
//
//  Created by Vikash Anand on 25/07/21.
//

import SwiftUI

struct FoodDetailView: View {
    var food: Food

    var body: some View {
        ListView(food: food)
    }
}

struct FoodDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FoodDetailView(food: Food.mock)
    }
}
