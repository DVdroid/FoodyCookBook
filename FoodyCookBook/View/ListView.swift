
import SwiftUI

struct ListView: View {
    var food: Food

    var body: some View {
        VStack {

            Text("Ingredients")
                .frame(width: UIScreen.main.bounds.width / 1.1, alignment: .leading)
                .font(.body)
                .padding(.init(top: 0.0,
                               leading: 20.0,
                               bottom: 0.0,
                               trailing: 0.0))

            if let foodItem = food.meals.first,
               let rows = foodItem.ingredients {

                List(rows, id: \.ingredientID) { row in
                    HStack {
                        Text(row.ingredient ?? "")
                        Text(row.measure ?? "")
                    }
                }
            } else {
                List([0], id: \.self) { _ in Text("Loading") }
            }
        }.padding(.init(top: 10, leading: 10, bottom: 10, trailing: 10))
    }
}


#if DEBUG

struct ListView_Previews: PreviewProvider {
	static var previews: some View {
        ListView(food: Food.mock)
	}
}
#endif
