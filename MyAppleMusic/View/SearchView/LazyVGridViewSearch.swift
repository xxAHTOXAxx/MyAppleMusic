import SwiftUI

struct LazyVGridViewSearch: View {
    let title: String = "Поиск по категориям"
    let columns = [(GridItem(.flexible())),
                   (GridItem(.flexible()))]
    @State private var searchText: String = ""
    @State private var items = ModelItemsForSearch.itemsArray
    
    var body: some View {
        VStack(alignment: .leading) {
            
            ZStack {
                TextField("", text: $searchText)
                    .padding(8)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .overlay(
                        HStack {
                            //Spacer()
                            Text("Поиск")
                                .foregroundColor(.gray)
                                .padding(.leading, -145)
                        }
                    )
                
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                    .padding(.leading, -170)
                
                Spacer()
            }
            .padding()
            
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .padding(.leading, 18)
            
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: columns, alignment: .center) {
                    ForEach (items, id: \.self) { item in
                        ZStack(alignment: .bottomLeading) {
                            Image(item.itemImage)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 170, height: 140)
                                .cornerRadius(8)
                            
                            Text(item.genreOfMusic)
                                .font(.subheadline)
                                .foregroundColor(.white)
                                .padding()
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    LazyVGridViewSearch()
}
