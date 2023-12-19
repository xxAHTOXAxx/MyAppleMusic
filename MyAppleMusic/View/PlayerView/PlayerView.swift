import SwiftUI

struct PlayerView: View {
    var imageMusic: Image = Image("flyAway")
    var nameMusic: String = "Улетай на крыльях ветра"
    @State private var isFullScreen = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(Color(UIColor.systemGray5))
                .frame(height: 50)
                .padding(.horizontal, 20)
            
            HStack {
                imageMusic
                    .resizable()
                    .frame(width: 40, height: 40)
                    .colorMultiply(Color(UIColor.systemGray4))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .onTapGesture {
                        isFullScreen = true
                    }
                    .offset(x: -10)
                
                Text(nameMusic)
                    .offset(x: -5)
                
                Button(action: {
                    
                }) {
                    Image(systemName: "play.fill")
                        .foregroundColor(.black)
                        .imageScale(.large)
                }
                .offset(x: 10)
                
                Button(action: {
                    
                }) {
                    Image(systemName: "forward.fill")
                        .foregroundColor(.black)
                        .imageScale(.large)
                }
                .offset(x: 10)
            }
        }
        .fullScreenCover(isPresented: $isFullScreen) {
            PlayerViewFullScreen(backgroundImage: imageMusic, nameMusic: nameMusic, imageMusic: imageMusic)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            let translation = value.translation
                            if translation.height > 50 { 
                                isFullScreen = false
                            }
                        }
                )
                .edgesIgnoringSafeArea(.all)
        }
    }
}

#Preview {
    PlayerView()
}
