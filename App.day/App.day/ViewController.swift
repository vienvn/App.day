//
//  ViewController.swift
//  App.day
//
//  Created by iOS Dev on 6/22/16.
//  Copyright © 2016 iOS Dev. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {

  @IBOutlet weak var tableView: UITableView!
  
  var dataList: [Post] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    tableView.delegate = self
    tableView.dataSource = self
    tableView.rowHeight = UITableViewAutomaticDimension
    tableView.estimatedRowHeight = 88.0
    
    Service.sharedInstance.getPosts { (data) in
      self.dataList = data
      self.tableView.reloadData()
    }
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}

extension ViewController: UITableViewDelegate {
  
}

extension ViewController: UITableViewDataSource {

  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dataList.count
  }
  
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCellWithIdentifier("postcell")! as! PostTableViewCell
    
    
    if let avatarImage = cell.viewWithTag(100) as? UIImageView {
      avatarImage.sd_setImageWithURL(NSURL(string: dataList[indexPath.row].userAvatar), completed: nil)
    }
    
    if let nameLabel = cell.viewWithTag(200) as? UILabel {
      nameLabel.text = dataList[indexPath.row].posterName
    }
    
    if let textLabel = cell.viewWithTag(300) as? UILabel {
      textLabel.text = dataList[indexPath.row].postText
    }
    
    return cell
  }
}