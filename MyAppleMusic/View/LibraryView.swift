import SwiftUI

struct ContentView: View {
    @State private var isEditing = false
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView {
                NavigationView {
                    //                    if isEditing {
                    //                        EditView()
                    //                    } else {
                    //                        LibraryView()
                    //                        }
                    //                        .navigationTitle("Медиатека")
                    //                        .navigationBarItems(trailing:
                    //                                                Button(action: {
                    //                            self.isEditing.toggle()
                    //                        }) {
                    //                            Text(self.isEditing ? "Готово" : "Править")
                    //                                .foregroundColor(Color.red)
                    //                        }
                    //                        )
                    Group {
                        if isEditing {
                            EditView()
                                .navigationTitle("Медиатека")
                                .navigationBarItems(trailing:
                                                        Button(action: {
                                    self.isEditing.toggle()
                                }) {
                                    Text("Готово")
                                        .foregroundColor(Color.red)
                                }
                                )
                        } else {
                            LibraryView()
                                .navigationTitle("Медиатека")
                                .navigationBarItems(trailing:
                                                        Button(action: {
                                    self.isEditing.toggle()
                                }) {
                                    Text("Править")
                                        .foregroundColor(Color.red)
                                }
                                )
                        }
                    }
                }
                .tabItem {
                    Image(systemName: "music.note.house.fill")
                    Text("Медиатека")
                        .foregroundColor(Color.gray)
                }
                
                RadioView()
                    .tabItem {
                        Image(systemName: "dot.radiowaves.left.and.right")
                        Text("Радио")
                            .foregroundColor(Color.gray)
                    }
                
                Text("")
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Поиск")
                            .foregroundColor(Color.gray)
                    }
            }
            .accentColor(.red)
            .onAppear () {
                UITabBar.appearance().backgroundColor = .systemGray6
                UITabBar.appearance().barTintColor = .systemGray6
            }
            PlayerView()
                .padding(.bottom, 60)
        }
    }
}

#Preview {
    ContentView()
}
