import SwiftUI

struct LazyHGridViewSearchItemOne: View {
    let rows = [(GridItem(.flexible()))]
    var items = ModelItemsForSearchViewItem.itemsArray
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: rows) {
                ForEach (items, id: \.self) { item in
                    VStack(alignment: .leading, spacing: 4) {
                        Text(item.leafType ?? "")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Text(item.description ?? "")
                            .font(.headline)
                            .foregroundColor(.gray)
                        Text(item.executor ?? "")
                            .font(.subheadline)
                            .font(.headline)
                        Image(item.itemImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 350, height: 220)
                            .clipped()
                            .padding(2)
                    }
                    .padding(3)
                    .background(Color.white)
                    .frame(width: 355, height: 300)
                    .padding(.leading, 15)
                }
            }
        }
    }
}

#Preview {
    LazyHGridViewSearchItemOne()
}
