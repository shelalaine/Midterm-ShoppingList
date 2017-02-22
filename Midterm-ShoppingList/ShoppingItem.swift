//
//  File Name:          ShoppingList.swift
//  Application Name:   Midterm-ShoppingList
//  Description:        Model for the shopping items
//
//  Created by:         Shelalaine Chan 
//  Student ID:         300924281
//  Change History:     2017-02-21, Created
// 
//  Copyright © 2017 ShelalaineChan. All rights reserved.
//

import Foundation

class ShoppingItem {
    var item: String
    var quantity: Int
    
    init(item: String, quantity: Int) {
        self.item = item
        self.quantity = quantity
    }
}
