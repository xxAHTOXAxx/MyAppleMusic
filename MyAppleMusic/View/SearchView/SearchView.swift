import SwiftUI

struct SearchView: View {
    
    var body: some View {
        NavigationView {
            LazyVGridViewSearch()
        }
        .navigationTitle("Поиск")
    }
}

#Preview {
    SearchView()
}
