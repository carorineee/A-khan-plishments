//
//  ViewController.swift
//  A(khan)plishments
//
//  Created by Caroline Shi on 10/10/16.
//  Copyright © 2016 CarolineShi. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class CategoriesTableViewController: UITableViewController {
    
    //MARK: Variables
    var categories = [Category]()
    var requester = DataRequest()
    
    
    //MARK: TableView methods
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.categories.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        
        cell.textLabel?.text = (self.categories[indexPath.row].name)!
        cell.detailTextLabel?.text = (self.categories[indexPath.row].description)!
        
        
        return cell
    }
    

    
    //MARK: Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.requester.fetchCategories(completion: {
            categories in
            self.categories = categories!
            self.tableView.reloadData()
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CategorySelected" {
            if let index = tableView.indexPathForSelectedRow?.row, let destinationViewController = segue.destination as? BadgesTableViewController {
                destinationViewController.categoryID = categories[index].categoryID
                destinationViewController.categoryName = categories[index].name
            }
        }
    }

    

}

