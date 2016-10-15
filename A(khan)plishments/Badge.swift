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
    var category: Int?
    var description: String?
    var icon_src: String?
    var absolute_url: String?
    var points: Int?

    required init(json: JSON) {
        self.name = json["translated_description"].stringValue
        self.category = json["badge_category"].int
        self.description = json["translated_safe_extended_description"].stringValue
        self.icon_src = json["icon_src"].stringValue
        self.absolute_url = json["absolute_url"].stringValue
        self.points = json["points"].int
    }

}
