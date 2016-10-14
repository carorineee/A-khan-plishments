//
//  DataRequest.swift
//  A(khan)plishments
//
//  Created by Caroline Shi on 10/12/16.
//  Copyright © 2016 CarolineShi. All rights reserved.
//

import Alamofire
import SwiftyJSON

let baseURL = "https://www.khanacademy.org"
let badgeEndpoint = "/api/v1/badges"
let categoryEndpoint = "/api/v1/badges/categories"

class DataRequest {
    
    var categories = [JSON]()
    var badges = [JSON]()
    
    func fetchCategories(completion: @escaping (([JSON]?) -> Void)) {
        
        var cats = [JSON]()
        
        Alamofire.request("\(baseURL)\(categoryEndpoint)").responseJSON { response in
            switch response.result {
            case .success:
                if let returnedJSON = response.result.value {
                    let json = JSON(returnedJSON)
                    for (_, subJson):(String, JSON) in json {
                        cats.append(subJson)
                    }
                }
            completion(cats)
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetchBadges() -> [JSON] {
        Alamofire.request("\(baseURL)\(badgeEndpoint)").responseJSON { (response) -> Void in
            
            if let returnedJSON = response.result.value {
                let json = JSON(returnedJSON)
                for (_, subJson):(String, JSON) in json {
                    self.badges.append(subJson)
                }
            }
        }
        return badges
    }


}

// https://www.khanacademy.org/api/v1/badges/categories
