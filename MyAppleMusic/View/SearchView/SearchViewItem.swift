
import SwiftUI

struct SearchViewItem: View {
    let genreOfMusic: String
    
    init(genreOfMusic: String) {
        self.genreOfMusic = genreOfMusic
    }
    var body: some View {
        NavigationView {
          ScrollView (.vertical, showsIndicators: false) {
                VStack {
                    //Divider().background(Color(UIColor.systemGray5))
                    LazyHGridViewSearchItemOne()
                    //Divider().background(Color(UIColor.systemGray5))
                    LazyHGridViewSearchItemTwo()
                }
               .navigationTitle(genreOfMusic)
            }
        }
    }
}

#Preview {
    SearchViewItem(genreOfMusic: <#String#>)
}
