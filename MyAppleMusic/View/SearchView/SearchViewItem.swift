import SwiftUI

struct SearchViewItem: View {
    var genreOfMusic: String
    
    init(genreOfMusic: String) {
        self.genreOfMusic = genreOfMusic
    }
    var body: some View {
        NavigationView {
            ScrollView (.vertical, showsIndicators: false) {
                VStack {
                    LazyHGridViewSearchItemOne()
                    LazyHGridViewSearchItemTwo()
                }
                //.navigationTitle(genreOfMusic)
                .navigationBarTitle(genreOfMusic, displayMode: .large)
                
            }
        }
    }
}

#Preview {
    SearchViewItem(genreOfMusic: "")
}
