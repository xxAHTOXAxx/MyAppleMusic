import SwiftUI

struct RadioView: View {
    var body: some View {
        NavigationView {
          ScrollView (.vertical, showsIndicators: false) {
                VStack {
                    Divider().background(Color(UIColor.systemGray5))
                    LazyHGridView()
                    Divider().background(Color(UIColor.systemGray5))
                    LazyVGridView()
                }
               .navigationTitle("Радио")
              
            }
        }
    }
}

#Preview {
    RadioView()
}
