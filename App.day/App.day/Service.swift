//
//  Service.swift
//  App.day
//
//  Created by iOS Dev on 6/22/16.
//  Copyright © 2016 iOS Dev. All rights reserved.
//

import Foundation

import Alamofire
import SwiftyJSON

class Service {
  static let sharedInstance = Service()
  
  let URLString = "https://alpha-api.app.net/stream/0/posts/stream/global"
  
  func getPosts(action: (data: [Post])->()) {
    var list: [Post] = []
    Alamofire.request(.GET, URLString).validate().responseJSON { response in
      switch response.result {
      case .Success(let data):
        let json = JSON(data)
        let upcomings = json["data"].array
        
        for obj in upcomings! {
          list.append(Post(json: obj))
        }
        action(data: list)
      case .Failure(let error):
        print("Request failed with error: \(error)")
      }
    }
  }
  
}
