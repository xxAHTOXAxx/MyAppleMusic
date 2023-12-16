import SwiftUI

struct PlayerViewFullScreen: View {
    var backgroundImage: Image
    var nameMusic: String
    var imageMusic: Image
    
    init(backgroundImage: Image, nameMusic: String, imageMusic: Image) {
        self.backgroundImage = backgroundImage
        self.nameMusic = nameMusic
        self.imageMusic = imageMusic
    }
    
    @State private var currentTime: TimeInterval = 0
    @State private var totalTime: TimeInterval = 180
    @State private var volume: Double = 0.5
    @State private var isAnimating = false
    @State private var offset: CGSize = .zero
    @State private var draggingDown = false
    @State private var accumulatedDragOffset: CGFloat = 0
    @State private var isFullScreen = true
    @State private var dragOffset: CGSize = .zero
    
    var body: some View {
        ZStack {
            backgroundImage
                .resizable()
                .blur(radius: 40)
            
            VStack(spacing: 0) {
                
                Spacer()
                imageMusic
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                    .cornerRadius(12)
                    
               // Spacer()
                
                HStack {
                        VStack(alignment: .leading) {
                                Text(nameMusic)
                                    .font(.title)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                    .lineLimit(1)
                                    .minimumScaleFactor(0.5)
                                    .offset(x: isAnimating ? 150 : -150)
                                    .animation(Animation.linear(duration: 8).repeatForever(autoreverses: true))
                            }
                            .padding(.trailing, 40)
                    
                    Spacer()
                    
                    Button(action: {}) {
                        Image(systemName: "ellipsis.circle")
                            .font(.title2)
                            .foregroundColor(.white)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 40)
                .onAppear {
                    isAnimating = true
                }
                
                Slider(value: Binding(get: {
                    currentTime
                }, set: { newValue in
                    currentTime = newValue
                }), in: 0...totalTime)
                .padding(.horizontal, 20)
                .accentColor(.white)
                .padding(.bottom, 10)
                
                HStack {
                    Text(timeString(time: currentTime))
                        .font(.caption)
                        .foregroundColor(.white)
                    Spacer()
                    Text(timeString(time: totalTime))
                        .font(.caption)
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 30)
                
                HStack {
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "backward.fill")
                            .font(.title)
                            .padding()
                            .foregroundColor(.white)
                    }
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "play.fill")
                            .font(.system(size: 50))
                            .foregroundColor(.white)
                    }
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "forward.fill")
                            .font(.title)
                            .padding()
                            .foregroundColor(.white)
                    }
                    Spacer()
                }
                .padding(.bottom, 60)
                
                HStack {
                    Image(systemName: "speaker.fill")
                        .font(.system(size: 10))
                        .foregroundColor(.white)
                    
                    Slider(value: $volume)
                        .accentColor(.white)
                    
                    Image(systemName: "speaker.wave.2.fill")
                        .font(.system(size: 10))
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 40)
                
                HStack {
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "quote.bubble")
                            .font(.system(size: 20))
                            .padding()
                            .foregroundColor(.white)
                    }
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "airplayaudio")
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                    }
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "list.bullet")
                            .font(.system(size: 20))
                            .padding()
                            .foregroundColor(.white)
                    }
                    Spacer()
                }
                
                
                .foregroundColor(.accentColor)
                .padding(.horizontal, 20)
            }
            .edgesIgnoringSafeArea(.all)
            .offset(y: dragOffset.height + accumulatedDragOffset)
                        .animation(.easeInOut)
            
        }
    }
    
    func timeString(time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

#Preview {
    PlayerViewFullScreen(backgroundImage: Image("flyAway"), nameMusic: "Улетай на крыльях ветра", imageMusic: Image(""))
}
