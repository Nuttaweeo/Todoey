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
    
    // stast using UserDefault
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        let newItem = Item()
        newItem.title = "Find Mike"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "Buy Eggos"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Destory Demogorgon"
        itemArray.append(newItem3)
        
        //to show new todo list that been added everytime when app is opened
        if let items = defaults.array(forKey: "TodoListArray") as? [Item] {
            itemArray = items
        }

        
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
        
        
        tableView.reloadData()
        
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
            
            // set new item array to userdefault
            self.defaults.setValue(self.itemArray, forKey: "TodoListArray")
            
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

