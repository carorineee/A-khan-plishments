//
//  BadgesTableViewController.swift
//  A(khan)plishments
//
//  Created by Caroline Shi on 10/13/16.
//  Copyright © 2016 CarolineShi. All rights reserved.
//

import UIKit

class BadgesTableViewController: UITableViewController {
    
    
    //TODO: Make title display category title
    
    var badges = [Badge]()
    var categoryID: Int?
    var requester = DataRequest()


    //MARK: Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.requester.fetchBadgesWithCategory(categoryIndex: self.categoryID!, completion: {
            badges in
            self.badges = badges!
            self.tableView.reloadData()
        })
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return badges.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BadgeCell", for: indexPath)
        cell.textLabel?.text = badges[indexPath.row].name

        return cell
    }
 

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "BadgeSelected" {
            //TODO: Pass the badge
            if let row = tableView.indexPathForSelectedRow?.row, let detailsViewController = segue.destination as? BadgeDetailViewController {
                detailsViewController.badge = self.badges[row]
            }
        }
        
        
    }
    

}
