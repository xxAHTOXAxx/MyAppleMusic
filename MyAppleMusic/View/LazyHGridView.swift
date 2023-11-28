import SwiftUI

struct LazyHGridView: View {
    let rows = [(GridItem(.flexible()))]
    var items = ModelItemsForRadioView.itemsArray
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: rows) {
                ForEach (items, id: \.self) { item in
                    VStack(alignment: .leading, spacing: 4) {
                        Text(item.radioStationCategory ?? "")
                            .font(.headline)
                            .foregroundColor(.gray)
                        
                        Text(item.genreOfMusic)
                            .font(.subheadline)
                            .font(.headline)
                        
                        Text(item.nameMusic)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
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
    LazyHGridView()
}
