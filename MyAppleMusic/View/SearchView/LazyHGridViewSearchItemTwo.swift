
import SwiftUI

struct LazyHGridViewSearchItemTwo: View {
    let rows = [(GridItem(.flexible()))]
    var items = ModelItemsForRadioView.itemsArray
    let title: String = "Станции"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Text(title)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.leading, 18)
                    .padding(.trailing, 160)
                Button(action: {
                }) {
                    Text("См. все")
                        .foregroundColor(Color.red)
                }
            }
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: rows) {
                    ForEach (items, id: \.self) { item in
                        VStack(alignment: .leading, spacing: 4) {
                            
                            Image(item.itemImage)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 350, height: 220)
                                .clipped()
                                .padding(2)
                            
                            Text(item.radioStationCategory ?? "")
                                .font(.headline)
                                .foregroundColor(.gray)
                            
                            Text(item.genreOfMusic)
                                .font(.subheadline)
                                .font(.headline)
                            
                            Text(item.nameMusic)
                                .font(.subheadline)
                                .foregroundColor(.gray)
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
}
#Preview {
    LazyHGridViewSearchItemTwo()
}
