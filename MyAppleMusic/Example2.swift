
import SwiftUI

struct PlayerView1: View {
    @State private var currentTime: TimeInterval = 0
    @State private var totalTime: TimeInterval = 180 // Пример времени в секундах для песни
    @State private var volume: Double = 0.5

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Button(action: {}) {
                    Image(systemName: "chevron.down")
                        .font(.title2)
                }
                Spacer()
                Text("Сейчас играет")
                    .font(.title3)
                Spacer()
                Button(action: {}) {
                    Image(systemName: "ellipsis")
                        .font(.title2)
                }
            }
            .padding()
            Divider()

            Image("album_cover") // Замените "album_cover" на название изображения вашей обложки альбома
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 300)
                .cornerRadius(12)

            Text("Название трека")
                .font(.title)
                .fontWeight(.semibold)
                .padding(.top, 20)
            
            Text("Исполнитель")
                .font(.headline)
                .foregroundColor(.gray)

            HStack {
                Text(timeString(time: currentTime))
                    .font(.caption)
                Spacer()
                Text(timeString(time: totalTime))
                    .font(.caption)
            }
            .padding(.horizontal)

            Slider(value: Binding(get: {
                currentTime
            }, set: { newValue in
                currentTime = newValue
            }), in: 0...totalTime)
            .padding(.horizontal)
            .accentColor(.green)

            HStack {
                Image(systemName: "speaker.fill")
                    .font(.title2)
                    .foregroundColor(.gray)
                Slider(value: $volume)
                    .accentColor(.green)
                Image(systemName: "speaker.wave.2.fill")
                    .font(.title2)
                    .foregroundColor(.gray)
            }
            .padding(.horizontal)
            .padding(.bottom)

            HStack {
                Button(action: {}) {
                    Image(systemName: "shuffle")
                        .font(.title2)
                }
                Spacer()
                Button(action: {}) {
                    Image(systemName: "backward.fill")
                        .font(.title)
                        .padding()
                }
                Spacer()
                Button(action: {}) {
                    Image(systemName: "play.circle.fill")
                        .font(.system(size: 70))
                }
                Spacer()
                Button(action: {}) {
                    Image(systemName: "forward.fill")
                        .font(.title)
                        .padding()
                }
                Spacer()
                Button(action: {}) {
                    Image(systemName: "repeat")
                        .font(.title2)
                }
            }
            .foregroundColor(.accentColor)
            .padding(.vertical)
        }
    }

    func timeString(time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

struct PlayerView_Previews1: PreviewProvider {
    static var previews: some View {
        PlayerView1()
    }
}
