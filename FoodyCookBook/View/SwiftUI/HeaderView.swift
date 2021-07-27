//
//  HeaderView.swift
//  FoodyCookBook
//
//  Created by Vikash Anand on 26/07/21.
//

import SwiftUI

struct HeaderView: View {
    
    var title: String
    
    var body: some View {
        VStack {
            Text("\(title)")
                .font(.title)
                .multilineTextAlignment(.center)
                .padding(EdgeInsets(top: 10.0,
                                    leading: 10.0,
                                    bottom: 0.0,
                                    trailing: 10.0))
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "Title")
    }
}
