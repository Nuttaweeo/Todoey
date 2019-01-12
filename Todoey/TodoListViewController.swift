//
//  ViewController.swift
//  Todoey
//
//  Created by mac on 12/1/2562 BE.
//  Copyright © 2562 nuttaweeO. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray = ["Find Mike", "Buy Egg", "Destory Demegogon"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK - Tableview Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
    
    // MARK - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //print(itemArray[indexPath.row]) // print row's name that was selected
        
        // add and remove checkmark when row is selected
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        
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
            
            self.itemArray.append(textField.text!) // add new todo list from textField to itemArray
            
            self.tableView.reloadData() // reload tableView to show the new list in Array that justed created
            
        }
        
        // add textfeild in popUp that will show this word "Create new item" and will disappear when user add text to textfield.
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        alert.addAction(action) // call alert.addAction(action) to use the add new item method.
        
        present(alert, animated: true, completion: nil) // call this method to show alert method
        
    }
    


}

