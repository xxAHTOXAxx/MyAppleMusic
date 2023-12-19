import Foundation
import SwiftUI

struct ModelItemsForSearch: Equatable, Hashable {
    var itemImage: String
    var genreOfMusic: String
}

extension ModelItemsForSearch {
    static var itemsArray: [ModelItemsForSearch] = [
        ModelItemsForSearch(itemImage: "station1", genreOfMusic: "Поп"),
        ModelItemsForSearch(itemImage: "station2",  genreOfMusic: "Рок"),
        ModelItemsForSearch(itemImage: "station3", genreOfMusic: "Транс"),
        ModelItemsForSearch(itemImage: "station4",  genreOfMusic: "Клубная музыка"),
        ModelItemsForSearch(itemImage: "station5",  genreOfMusic: "Русские хиты"),
        ModelItemsForSearch(itemImage: "station6", genreOfMusic: "Музыка 00-х" ),
        ModelItemsForSearch(itemImage: "station7",  genreOfMusic: "Джаз"),
        ModelItemsForSearch(itemImage: "station8",  genreOfMusic: "MIX")
    ]
}
