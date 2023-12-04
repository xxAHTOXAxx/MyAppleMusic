import SwiftUI

struct SearchView: View {
    
    var body: some View {
        
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGridViewSearch()
                    .navigationTitle("Поиск")
            }
        }
    }
}

#Preview {
    SearchView()
}
