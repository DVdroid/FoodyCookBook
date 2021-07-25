
import SwiftUI

struct ListView: View {
    var food: Food

    var body: some View {
        VStack {
            if let rows = food.meals.first?.ingredients {
                AsyncImage(with: food.meals.first?.strMealThumb ?? "")
                    .frame(width: 400, height: 400, alignment: .center)
                    .padding(.init(top: 10, leading: 10, bottom: 10, trailing: 10))

                List(rows, id: \.ingredientID) { row in
                    HStack {
                        Text(row.ingredient ?? "")
                        Text(row.measure ?? "")
                    }
                }
            } else {
                List([0], id: \.self) { _ in Text("Loading") }
            }
        }
    }
}

#if DEBUG
struct ListView_Previews: PreviewProvider {
	static var previews: some View {
        ListView(food: Food.mock)
	}
}
#endif
