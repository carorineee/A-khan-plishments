//
//  BadgeDetailViewController.swift
//  A(khan)plishments
//
//  Created by Caroline Shi on 10/10/16.
//  Copyright © 2016 CarolineShi. All rights reserved.
//

import UIKit

class BadgeDetailViewController: UIViewController {

    //MARK: Outlets
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var badgeTitle: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
