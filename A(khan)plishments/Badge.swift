//
//  Badge.swift
//  A(khan)plishments
//
//  Created by Caroline Shi on 10/11/16.
//  Copyright © 2016 CarolineShi. All rights reserved.
//

import Foundation
import SwiftyJSON

class Badge {
    
    var name: String?
    var categoryID: Int?
    var description: String?
    var icons: [String:String]?
    var icon_src: String?
    var absolute_url: String?
    var points: Int?

    required init(json: JSON) {
        self.name = json["translated_description"].stringValue
        self.categoryID = json["badge_category"].int
        self.description = json["translated_safe_extended_description"].stringValue
        self.icons = json["icons"].dictionaryObject as! [String : String]?
        self.icon_src = json["icon_src"].stringValue
        self.absolute_url = json["absolute_url"].stringValue
        self.points = json["points"].int
    }

}
