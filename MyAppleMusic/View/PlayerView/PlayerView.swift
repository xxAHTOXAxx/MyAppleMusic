import SwiftUI

struct PlayerView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(Color(UIColor.systemGray5))
                .frame(height: 50)
                .padding(.horizontal, 20)
            
            HStack {
                RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color(UIColor.systemGray4))
                            .frame(width: 40, height: 40)
                            .overlay(
                                Image("notExecuted")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .colorMultiply(Color(UIColor.systemGray4))
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                            )
                            .offset(x: -45)
                
                Text("Не исполняется")
                    .offset(x: -40)
                
                Button(action: {
                   
                }) {
                    Image(systemName: "play.fill")
                        .foregroundColor(.black)
                        .imageScale(.large)
                }
                .offset(x: 20)
                
                Button(action: {
                    
                }) {
                    Image(systemName: "forward.fill")
                        .foregroundColor(.black)
                        .imageScale(.large)
                }
                .padding(.trailing, -10)
                .offset(x: 25)
            }
        }
    }
}

#Preview {
    PlayerView()
}
