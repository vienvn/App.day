//
//  Post.swift
//  App.day
//
//  Created by iOS Dev on 6/22/16.
//  Copyright © 2016 iOS Dev. All rights reserved.
//

import Foundation
import SwiftyJSON

class Post {
  var userAvatar: String!
  var posterName: String!
  var postText: String!
  var createdAt: NSDate!
  
  init(userAvatar: String, posterName: String, postText: String, createdAt: NSDate) {
    self.userAvatar = userAvatar
    self.posterName = posterName
    self.postText = postText
    self.createdAt = createdAt
  }
  
  init(json: JSON) {
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
    dateFormatter.timeZone = NSTimeZone(forSecondsFromGMT: 0)

    self.userAvatar = json["user"]["avatar_image"]["url"].stringValue
    self.posterName = json["user"]["name"].stringValue
    self.postText = json["text"].stringValue
    self.createdAt = dateFormatter.dateFromString(json["created_at"].stringValue)
  }
}