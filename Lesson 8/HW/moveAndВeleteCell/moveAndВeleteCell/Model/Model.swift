//
//  Model.swift
//  moveAndВeleteCell
//
//  Created by Роман on 28.03.2022.
//

import Foundation

struct Item {
    var nameItem: String
    var itemToList: [Food]

}

struct Food {
    var nameFood: String
}

var itemList = [
    Item(nameItem: "Fruit", itemToList: [Food(nameFood: "Apple"),
                                         Food(nameFood: "Avocado"),
                                         Food(nameFood: "Apricot"),
                                         Food(nameFood: "Grapes"),]),
    Item(nameItem: "Vegetables", itemToList: [Food(nameFood: "Squash"),
                                              Food(nameFood: "Cabbage"),
                                              Food(nameFood: "Potato"),
                                              Food(nameFood: "Onion"),]),
    Item(nameItem: "Fish", itemToList: [Food(nameFood: "Carp"),
                                        Food(nameFood: "Vobla"),
                                        Food(nameFood: "Peled"),
                                        Food(nameFood: "Omul"),]),
    Item(nameItem: "Meat", itemToList: [Food(nameFood: "Beef"),
                                        Food(nameFood: "Duck"),
                                        Food(nameFood: "Pork"),
                                        Food(nameFood: "Lamb"),]),
]

