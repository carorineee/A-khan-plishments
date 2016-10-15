//
//  Category.swift
//  A(khan)plishments
//
//  Created by Caroline Shi on 10/12/16.
//  Copyright © 2016 CarolineShi. All rights reserved.
//

import Foundation
import SwiftyJSON

class Category {

    var name: String?
    var categoryID: Int?
    var description: String?
    var chart_icon_src: String?
    var icon_src: String?
    var large_icon_src: String?

    required init(json: JSON) {
        self.name = json["type_label"].stringValue
        self.categoryID = json["category"].int
        self.description = json["description"].stringValue
        self.chart_icon_src = json["chart_icon_src"].stringValue
        self.icon_src = json["icon_src"].stringValue
        self.large_icon_src = json["large_icon_src"].stringValue
    
    }

}
