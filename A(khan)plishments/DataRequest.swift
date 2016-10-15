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
    
    func fetchCategories(completion: @escaping (([Category]?) -> Void)) {
        
        var categories = [Category]()
        
        Alamofire.request("\(baseURL)\(categoryEndpoint)").responseJSON { response in
            switch response.result {
            case .success:
                if let returnedJSON = response.result.value {
                    let json = JSON(returnedJSON)
                    let jsonArray = json.arrayValue
                    categories = jsonArray.map({
                        Category(json: $0)
                    })
                }
            completion(categories)
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetchBadgesWithCategory(categoryIndex: Int, completion: @escaping (([Badge]?) -> Void)) {
        
        var badges = [Badge]()
        
        Alamofire.request("\(baseURL)\(badgeEndpoint)").responseJSON { response in
            switch response.result {
            case .success:
                if let returnedJSON = response.result.value {
                    let json = JSON(returnedJSON)
                    let jsonArray = json.arrayValue
                    badges = jsonArray.map({
                        Badge(json: $0)
                    })
                    badges = badges.filter({
                        $0.categoryID == categoryIndex
                    })
                }
                completion(badges)
                
            case .failure(let error):
                print(error)
            }
        }
    }


}

