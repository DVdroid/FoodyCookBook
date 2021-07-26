//
//  HeaderView.swift
//  FoodyCookBook
//
//  Created by Vikash Anand on 26/07/21.
//

import SwiftUI

struct HeaderView: View {

    var title: String
    var subTitle: String

    var body: some View {
        VStack {
            Text("\(title)")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .padding(EdgeInsets(top: 10.0,
                                    leading: 10.0,
                                    bottom: 0.0,
                                    trailing: 10.0))
            Text("\(subTitle)")
                .font(.body)
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "Title", subTitle: "Subtitle")
    }
}
