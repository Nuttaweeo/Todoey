//
//  ViewController.swift
//  Todoey
//
//  Created by mac on 12/1/2562 BE.
//  Copyright © 2562 nuttaweeO. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray = [Item]()
    
    
    // creating the Item.plist to save all data in individual file inside iphone
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        loadItems()

        
    }
    
    // MARK - Tableview Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = itemArray[indexPath.row].title
        
        // add and remove checkmark when row is selected
        
        //Ternary operator
        //value = condition ? valueIfTrue : valueIfFalse
        
        cell.accessoryType = item.done == true ? .checkmark : .none
        
        return cell
        
    }
    
    
    
    // MARK - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //print(itemArray[indexPath.row]) // print row's name that was selected
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        saveItems()
        
        
        tableView.deselectRow(at: indexPath, animated: true) // add animetion when row is selected
    }
    
    // Mark - Add New items botton
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        // Create this variable to store the data and use this "textfield" to pass data to any {} that inside addButtonPressed action
        var textField = UITextField()
        
        // use UIAlertController for show the popup with have "action botton"
        let alert =  UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        
        // use UIAlertAction to create an action botton in popup
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            // what will happen once the user clkcks the Add Item on our UIAlert
            
            let newItem = Item()
            newItem.title = textField.text!
            
            self.itemArray.append(newItem) // add new todo list from textField to itemArray
            
            self.saveItems()
            
            
            
        }
        
        // add textfeild in popUp that will show this word "Create new item" and will disappear when user add text to textfield.
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        alert.addAction(action) // call alert.addAction(action) to use the add new item method.
        
        present(alert, animated: true, completion: nil) // call this method to show alert method
        
    }
    
    //MARK - Model Manupulation Methods
    
    func saveItems() {
        
        // set new item array to userdefault
        let encoder = PropertyListEncoder()
        
        do {
            let data = try encoder.encode(itemArray)
            try data.write(to :dataFilePath!)
        } catch {
            print("Error decoding item array, \(error)")
            
        }
        self.tableView.reloadData() // reload tableView to show the new list in Array that justed created
        
    }
    func loadItems() {
        if let data = try? Data(contentsOf: dataFilePath!) {
            let decoder = PropertyListDecoder()
            do {
                itemArray = try decoder.decode([Item].self , from: data)
            } catch {
                print("Error decoding item array, \(error)")
            }
        
    }



}
}
