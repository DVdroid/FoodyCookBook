//
//  FavouriteButton.swift
//  FoodyCookBook
//
//  Created by Vikash Anand on 26/07/21.
//

import SwiftUI

struct FavouriteButton: View {
    @Binding var isSet: Bool
    @State private var showingAlert = false
    var action: ((Bool) -> Void)
    
    var body: some View {
        Button(action: {
                isSet.toggle()
                showingAlert = true
                action(isSet)}) {
            Image(systemName: isSet ? "star.fill" : "star")
                .foregroundColor(isSet ? Color.yellow : Color.gray)
        }
        .foregroundColor(.orange)
        .cornerRadius(16)
        .frame(width: 80, height: 80.0)
    }
}

struct FavouriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteButton(isSet: .constant(true)){ _ in }
    }
}
