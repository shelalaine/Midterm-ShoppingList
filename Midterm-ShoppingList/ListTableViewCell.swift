//
//  File Name:          ListTableViewCell.swift
//  Application Name:   Midterm-ShoppingList
//  Description:        Custom list table view cell
//
//  Created by:         Shelalaine Chan
//  Student ID:         300924281
//  Change History:     2017-02-21, Created
// 
//  Copyright © 2017 ShelalaineChan. All rights reserved.
//

import UIKit

protocol ListTableViewCellDelegate {
    func updateItemQuantity(sender: ListTableViewCell, quantity: Int)
    func updateItemName(sender: ListTableViewCell, name: String)
}

class ListTableViewCell: UITableViewCell, UITextFieldDelegate {

 
    @IBOutlet weak var itemNameTextField: UITextField!
    @IBOutlet weak var itemLabelQuantity: UILabel!
    
    var cellDelegate: ListTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.itemNameTextField.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func changeStepperHandler(_ sender: UIStepper) {
        self.cellDelegate?.updateItemQuantity(sender: self, quantity: Int(sender.value))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        saveItemName(newName: itemNameTextField.text!)
        itemNameTextField.resignFirstResponder()
    }
    
    private func saveItemName(newName: String) {
        self.cellDelegate?.updateItemName(sender: self, name: newName)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("Did End editing")
        saveItemName(newName: itemNameTextField.text!)
        itemNameTextField.resignFirstResponder()
    }
    
    
}
