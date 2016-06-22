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
  
  init(userAvatar: String, posterName: String, postText: String) {
    self.userAvatar = userAvatar
    self.posterName = posterName
    self.postText = postText
  }
  
  init(json: JSON) {
    self.userAvatar = json["user"]["avatar_image"]["url"].stringValue
    self.posterName = json["user"]["name"].stringValue
    self.postText = json["text"].stringValue
  }
}