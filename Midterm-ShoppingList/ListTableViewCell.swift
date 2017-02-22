//
//  ListTableViewCell.swift
//  Midterm-ShoppingList
//
//  Created by Shelalaine Chan on 2017-02-21.
//  Copyright © 2017 ShelalaineChan. All rights reserved.
//

import UIKit

protocol ListTableViewCellDelegate {
    func updateItemQuantity(sender: ListTableViewCell, quantity: Double)
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
        self.cellDelegate?.updateItemQuantity(sender: self, quantity: sender.value)
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
