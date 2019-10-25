//
//  ViewController.swift
//  Shopping List
//
//  Created by IWAN EVANS on 25/10/2019.
//  Copyright © 2019 Iwan Evans. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var shopping = [String]()
    
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var Table: UITableView!
    @IBOutlet weak var inputText: UITextField!
    
    @IBAction func addPressed(_ sender: Any) {
        
        let items = inputText!.text
        shopping.append(items!)
        defaults.set(shopping, forKey: "shoppingListArray")
        Table.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        shopping.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "myCell")
        
        cell.textLabel!.text = shopping[indexPath.row]
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let items = UserDefaults.standard.array(forKey: "shoppingListArray") as? [String] {
            shopping = items
        }
       
         
        }


}

