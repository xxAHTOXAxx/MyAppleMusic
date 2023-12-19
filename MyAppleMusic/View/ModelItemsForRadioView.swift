import Foundation

struct ModelItemsForRadioView: Equatable, Hashable {
    var itemImage: String
    var radioStationCategory: String?
    var genreOfMusic: String
    var nameMusic: String
}

extension ModelItemsForRadioView {
    static var itemsArray: [ModelItemsForRadioView] = [
        ModelItemsForRadioView(itemImage: "station1", radioStationCategory: "Избранная радиостанция", genreOfMusic: "Поп", nameMusic: "Идеальная подборка для тебя"),
        ModelItemsForRadioView(itemImage: "station2", radioStationCategory: "Избранная радиостанция", genreOfMusic: "Рок", nameMusic: "Классика рока"),
        ModelItemsForRadioView(itemImage: "station3", radioStationCategory: "Избранная радиостанция", genreOfMusic: "Транс", nameMusic: "То что заставляет двигаться"),
        ModelItemsForRadioView(itemImage: "station4", radioStationCategory: "Избранная радиостанция", genreOfMusic: "Клубная музыка", nameMusic: "Тусить до утра"),
        ModelItemsForRadioView(itemImage: "station5", radioStationCategory: "Избранная радиостанция", genreOfMusic: "Русские хиты", nameMusic: "Самые русские хиты"),
        ModelItemsForRadioView(itemImage: "station6", radioStationCategory: "Избранная радиостанция", genreOfMusic: "Музыка 00-х", nameMusic: "Вспомни себя"),
        ModelItemsForRadioView(itemImage: "station7", radioStationCategory: "Избранная радиостанция", genreOfMusic: "Джаз", nameMusic: "Завораживающие трэки"),
        ModelItemsForRadioView(itemImage: "station8", radioStationCategory: "Избранная радиостанция", genreOfMusic: "MIX", nameMusic: "Под любое настроение")
    ]
}
