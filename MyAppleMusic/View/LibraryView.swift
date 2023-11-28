import SwiftUI

struct LibraryView: View {
    var body: some View {
            VStack {
                Spacer()
                Text("Ищете свою музыку?")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                Text("Здесь появиться купленная Вами в \n iTunes Store музыка")
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.center)
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .accentColor(.red)
    }
}

#Preview {
    LibraryView()
}
