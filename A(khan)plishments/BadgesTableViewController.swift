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

class BadgesTableViewController: UITableViewController {
    
    var categories = [JSON]()
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        
        cell.textLabel?.text = (self.categories[indexPath.row]["type_label"].string)!
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        Alamofire.request("https://www.khanacademy.org/api/v1/badges/categories").responseJSON { (response) -> Void in
            
            if let returnedJSON = response.result.value {
                
                let json = JSON(returnedJSON)
                
                for (_, subJson):(String, JSON) in json {
                    self.categories.append(subJson)
                }
                if self.categories.count > 0 {
                    self.tableView.reloadData()
                }
                
            }
            
            
        }
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}

