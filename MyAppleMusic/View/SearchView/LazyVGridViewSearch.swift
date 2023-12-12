import SwiftUI

struct LazyVGridViewSearch: View {
    let title: String = "Поиск по категориям"
    let columns = [(GridItem(.flexible())),
                   (GridItem(.flexible()))]
    @State private var searchText: String = ""
    @State private var items = ModelItemsForSearch.itemsArray
    @State private var isTapped = false
    @State private var isEditing = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                TextField("Поиск...", text: $searchText)
                    .padding(8)
                    .padding(.horizontal, 25)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .overlay(
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 8)
                     
                            if isEditing {
                                Button(action: {
                                    self.searchText = ""
                                }) {
                                    Image(systemName: "multiply.circle.fill")
                                        .foregroundColor(.gray)
                                        .padding(.trailing, 8)
                                }
                            }
                        }
                    )
                    .onTapGesture {
                        self.isEditing = true
                    }
                if isEditing {
                    Button(action: {
                        self.isEditing = false
                        self.searchText = ""

                    }) {
                        Text("Отменить")
                    }
                    .padding(.trailing, 10)
                    .transition(.move(edge: .trailing))
                    .animation(.default)
                }
            }
        }
        .padding()
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .padding(.leading, -65)
            
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: columns, alignment: .center) {
                    ForEach (items, id: \.self) { item in
                        
                        NavigationLink {
                            SearchViewItem(genreOfMusic: item.genreOfMusic)
                        } label: {
                            Image (item.itemImage)
                                .resizable()
                                .cornerRadius (10)
                                .frame (height: 125)
                                .overlay(alignment: .bottomLeading) {
                                    Text(item.genreOfMusic)
                                        .multilineTextAlignment(
                                            .leading)
                                        .font(.system(size: 13,
                                                      weight: .bold))
                                        .foregroundColor(.white)
                                        .padding([.horizontal,
                                                  .bottom])
                                }
                            
//                        ZStack(alignment: .bottomLeading) {
//                            Image(item.itemImage)
//                                .resizable()
//                                .aspectRatio(contentMode: .fill)
//                                .frame(width: 170, height: 140)
//                                .cornerRadius(8)
//                            
//                            Text(item.genreOfMusic)
//                                .font(.subheadline)
//                                .foregroundColor(.white)
//                                .padding()
                        }
                    }
                }
            }
            .padding(.horizontal, 10)
        }
    }

#Preview {
    LazyVGridViewSearch()
}
