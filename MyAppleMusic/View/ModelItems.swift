import Foundation
import SwiftUI

struct ModelItems: Equatable, Hashable {
    var itemImage: String
    var name: String
    var isSelected: Bool
}

extension ModelItems {
    @State static var arrayItems: [ModelItems] = [
        ModelItems(itemImage: "music.note.list", name: "Плейлисты", isSelected: false),
        ModelItems(itemImage: "music.mic", name: "Артисты", isSelected: false),
        ModelItems(itemImage: "square.stack", name: "Альбомы", isSelected: false),
        ModelItems(itemImage: "music.note", name: "Песни", isSelected: false),
        ModelItems(itemImage: "tv", name: "Телешоу и фильмы", isSelected: false),
        ModelItems(itemImage: "music.note.tv", name: "Видеоклипы", isSelected: false),
        ModelItems(itemImage: "guitars", name: "Жанры", isSelected: false),
        ModelItems(itemImage: "person.2.crop.square.stack", name: "Сборники", isSelected: false),
        ModelItems(itemImage: "music.quarternote.3", name: "Авторы", isSelected: false),
        ModelItems(itemImage: "arrow.down.circle", name: "Загружено", isSelected: false),
        ModelItems(itemImage: "music.note.house", name: "Домашняя коллекция", isSelected: false)
    ]
}
