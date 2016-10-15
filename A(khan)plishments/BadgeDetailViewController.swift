//
//  BadgeDetailViewController.swift
//  A(khan)plishments
//
//  Created by Caroline Shi on 10/10/16.
//  Copyright © 2016 CarolineShi. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class BadgeDetailViewController: UIViewController {

    //MARK: Outlets
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var badgeTitle: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var badge: Badge?
    
    func loadImage() -> Void {
        Alamofire.request("\((badge?.icons?["large"])!)").responseImage { response in
            switch response.result {
                case .success:
                    let image = response.result.value
                    self.iconImage.image = image
                case .failure(let error):
                    print(error)
            }
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //TODO: load info
        badgeTitle.text = badge?.name
        descriptionTextView.text = badge?.description
        loadImage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
