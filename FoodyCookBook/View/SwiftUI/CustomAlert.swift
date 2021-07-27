//
//  CustomAlert.swift
//  FoodyCookBook
//
//  Created by Vikash Anand on 27/07/21.
//

import SwiftUI

struct CustomAlert: View {

    var title: String
    var message: String
    @Binding var shouldShowPopUp: Bool

    var body: some View {
        ZStack {
            if shouldShowPopUp {
                popUpView()
            }
        }.onAppear {
            withAnimation(.linear(duration: 0.5)) {
                self.shouldShowPopUp = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                withAnimation(.linear(duration: 0.5)) {
                    self.shouldShowPopUp = false
                }
            }
        }
    }

    private func popUpView() -> some View {

        VStack (spacing : 10) {

            VStack {
                Text("\(title)")
                    .font(.body)
                    .foregroundColor(.white)
                Text("\(message)")
                    .font(.subheadline)
                    .foregroundColor(.white)
            }
        }
        .padding()
        .frame(width: UIScreen.main.bounds.width / 1.1, height: 100)
        .background(Color(UIColor.lightGray))
        .cornerRadius(20)
        .shadow(radius: 20)
        .opacity(0.8)
    }
}

struct CustomAlert_Previews: PreviewProvider {
    static var previews: some View {
        CustomAlert(title: "Title",
                    message: "Message",
                    shouldShowPopUp: .constant(true))
    }
}
