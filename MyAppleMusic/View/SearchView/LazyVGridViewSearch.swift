import SwiftUI

struct LazyVGridViewSearch: View {
    let title: String = "Поиск по категориям"
    let columns = [(GridItem(.flexible())),
                   (GridItem(.flexible()))]
    @State private var searchText: String = ""
    @State private var items = ModelItemsForSearch.itemsArray
    @State private var isTapped = false
    @State private var isEditing = false
    @State private var isSongListVisible = false
    private var array = ["Песня 1", "Песня 2", "Песня 3", "Песня 4"]
    
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
                        self.isSongListVisible = true
                    }
                
                if isEditing {
                    Button(action: {
                        self.isEditing = false
                        self.searchText = ""
                        self.isSongListVisible = false
                        
                    }) {
                        Text("Отменить")
                    }
                    .padding(.trailing, 10)
                    .transition(.move(edge: .trailing))
                    .animation(.default)
                }
                
            }
            .padding()
            if !isEditing {
                Text(title)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.leading, 10)
            }
            
            if isSongListVisible {
                List {
                    ForEach(array.filter { $0.hasPrefix(searchText) || searchText.isEmpty }, id: \.self) { searchText in
                        Text(searchText)
                            .onTapGesture {
                                print("Выбрана песня: \(searchText)")
                                self.isSongListVisible = false
                            }
                    }
                }
                .navigationBarTitle(Text("Песни"))
            } else {
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
                            }
                        }
                    }
                }
                .padding(.horizontal, 10)
            }
        }
    }
}
#Preview {
    LazyVGridViewSearch()
}

