import SwiftUI

struct LazyVGridView: View {
    let columns = [(GridItem(.fixed(375)))]
    @State private var items = ModelItemsForRadioView.itemsArray
    let title: String = "Станции"
    var body: some View {
        VStack(alignment: .leading) {
                    Text(title)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.leading, 18)
            ScrollView(.vertical, showsIndicators: false) {
               LazyVGrid(columns: columns, alignment: .leading) {
                    ForEach (items, id: \.self) { item in
                        HStack(spacing: 6) {
                            Image(item.itemImage)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100, height: 100)
                                .cornerRadius(2)
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text(item.genreOfMusic)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                    .font(.headline)
                                
                                Text(item.nameMusic)
                                    .font(.subheadline)
                            }
                        }
                        .padding(1)
                        .background(Color.white)
                        .padding(.horizontal, 18)
                        VStack {
                            Spacer()
                            Divider().background(Color(UIColor.systemGray5))
                                .frame(height: 1)
                                .padding(.leading, 110)
                                .padding(.horizontal, 18)
                        }
                    }
                }
            }
        }
   }
}

#Preview {
    LazyVGridView()
}

