//
//  ShoppingList.swift
//  Midterm-ShoppingList
//
//  Created by Shelalaine Chan on 2017-02-21.
//  Copyright © 2017 ShelalaineChan. All rights reserved.
//

import Foundation

class ShoppingList {
    var name: String
    var shoppingItems = [ShoppingItem]()
    
    init(name: String) {
        self.name =  name
    }
    
    func addItem(item: ShoppingItem) {
        shoppingItems.append(item)
    }
}
