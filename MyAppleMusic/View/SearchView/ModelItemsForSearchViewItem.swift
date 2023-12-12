import Foundation

struct ModelItemsForSearchViewItem: Equatable, Hashable {
    var itemImage: String
    var leafType: String?
    var description: String?
    var executor: String?
}

extension ModelItemsForSearchViewItem {
    static var itemsArray: [ModelItemsForSearchViewItem] = [
        ModelItemsForSearchViewItem(itemImage: "station1", leafType: "Избранный альбом", description: "Люди выбирают", executor: "Apple Music"),
        ModelItemsForSearchViewItem(itemImage: "station2",  leafType: "Избранный альбом", description: "Лучшие хиты", executor: "Apple Music"),
        ModelItemsForSearchViewItem(itemImage: "station3", leafType: "Избранный альбом", description: "Затягивают по самые уши", executor: "Apple Music"),
        ModelItemsForSearchViewItem(itemImage: "station4",  leafType: "Избранный альбом", description: "Хиты", executor: "Apple Music"),
        ModelItemsForSearchViewItem(itemImage: "station5",  leafType: "Избранный альбом", description: "Люби меня", executor: "Apple Music"),
        ModelItemsForSearchViewItem(itemImage: "station6", leafType: "Избранный альбом", description: "Классика жанра", executor: "Apple Music"),
        ModelItemsForSearchViewItem(itemImage: "station7",  leafType: "Избранный альбом", description: "И тебе зайдет", executor: "Apple Music"),
        ModelItemsForSearchViewItem(itemImage: "station8",  leafType: "Избранный альбом", description: "Отрывайся", executor: "Apple Music")
    ]
}
