//
//  ViewController.swift
//  Midterm-ShoppingList
//
//  Created by Shelalaine Chan on 2017-02-21.
//  Copyright © 2017 ShelalaineChan. All rights reserved.
//

import UIKit

class ViewController: UIViewController,
                        UITableViewDataSource,
                        UITableViewDelegate,
                        UITextFieldDelegate,
                        ListTableViewCellDelegate {
    
    
    @IBOutlet weak var itemTextField: UITextField!
    @IBOutlet weak var shoppingListLabelHeader: UILabel!
    @IBOutlet weak var listNameTextField: UITextField!
    @IBOutlet weak var table: UITableView!
    var shoppingItems = [ShoppingItem]()
    var shoppingList: ShoppingList?
    var shoppingNameEntered: Bool?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        listNameTextField.delegate = self
        shoppingNameEntered = false
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListItem", for: indexPath) as! ListTableViewCell
        cell.itemNameTextField.text = shoppingItems[indexPath.row].item
        cell.itemLabelQuantity.text = "\(shoppingItems[indexPath.row].quantity)"
        
        // Setup the delegate for the ListTableViewCell
        cell.cellDelegate = self
        return cell
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingItems.count
    }
    
    // MARK: Text Field
    func textFieldDidEndEditing(_ textField: UITextField) {
        saveShoppingList()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        saveShoppingList()
    }
    
    private func saveShoppingList() {
        if shoppingNameEntered == false {
            shoppingNameEntered = true
            shoppingList = ShoppingList(name: listNameTextField.text!)
            shoppingListLabelHeader.text = (shoppingList?.name)! + " items"
            listNameTextField.resignFirstResponder()
        } else {
            let newItem = itemTextField.text!
            shoppingList?.addItem(item: ShoppingItem(item: newItem, quantity: 1))
            shoppingItems.append(ShoppingItem(item: newItem, quantity: 1))
            
            // Update the table
            let count = (shoppingList?.shoppingItems.count)!
            table.beginUpdates()
            table.insertRows(at: [IndexPath(row: count - 1, section: 0)], with: .automatic)
            table.endUpdates()
            print("Added")
        }
    }
    
    // MARK: Action Handlers
    @IBAction func saveButton(_ sender: UIButton) {
    }
    
    @IBAction func cancelButton(_ sender: UIButton) {
    }
    
    
    // MARK: Protocol delegate implementation
    func updateItemQuantity(sender: ListTableViewCell, quantity: Double) {
        if let indexPath = self.table.indexPath(for: sender) {
            
            // Update the UI quantity and the list
            sender.itemLabelQuantity.text = "\(quantity)"
            shoppingItems[indexPath.row].quantity = quantity
            print("Index: \(indexPath.row) Quantity\(quantity)")
        }
    }

    func updateItemName(sender: ListTableViewCell, name: String) {
        if let indexPath = self.table.indexPath(for: sender) {
            
            // Update the UI quantity and the list
            shoppingItems[indexPath.row].item = name
            print("Index: \(indexPath.row) New Name: \(name)")
        }
    }

}

