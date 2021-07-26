//
//  DescriptionView.swift
//  FoodyCookBook
//
//  Created by Vikash Anand on 26/07/21.
//

import SwiftUI

struct DescriptionView: View {

    var title: String
    var subTitle: String
    var action: (() -> Void)
    @State private var isFavourite: Bool = false
    
    var body: some View {
        HStack {
            VStack {
                Text("\(title)")
                    .frame(width: UIScreen.main.bounds.width / 1.8, alignment: .leading)
                    .font(.title)
                Text("\(subTitle)")
                    .font(.caption)
                    .frame(width: UIScreen.main.bounds.width / 1.8, alignment: .leading)
            }

            Spacer()

            Button(action: action) {
                if isFavourite {
                    Image(systemName: "star.fill")
                } else {
                    Image(systemName: "star")
                }
            }
            .foregroundColor(.orange)
            .cornerRadius(16)
            .frame(width: 80, height: 80.0)
        }
        .padding()
    }

}

struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionView(title: "Title", subTitle: "Subtitle") {}
    }
}
