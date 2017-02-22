//
//  File Name:          ShoppingList.swift
//  Application Name:   Midterm-ShoppingList
//  Description:        Model for the Shopping List 
//
//  Created by:         Shelalaine Chan
//  Student ID:         300924281
//  Change History:     2017-02-21, Created
//
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
