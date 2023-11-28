import SwiftUI

struct EditView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var items = ModelItems.arrayItems
    
    func move(from source: IndexSet, to destination: Int) {
        items.move(fromOffsets: source, toOffset: destination)
    }
    
    @ViewBuilder var body: some View {
            List {
                ForEach(items.indices, id: \.self) { index in
                    HStack {
                        Button(action: {
                            items[index].isSelected.toggle()
                        }) {
                            if items[index].isSelected {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.red)
                                    .imageScale(.large)
                            } else {
                                Image(systemName: "circle")
                                    .foregroundColor(Color(UIColor.systemGray5))
                                    .imageScale(.large)
                            }
                        }
                        
                        Image(systemName: items[index].itemImage)
                            .foregroundColor(Color.red)
                            .padding(.trailing, 8)
                        Text(items[index].name)
                    }
                }
                .onMove(perform: move)
            }
            .listStyle(InsetListStyle())
    }
}

#Preview {
    EditView()
}
