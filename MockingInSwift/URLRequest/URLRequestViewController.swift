//
//  URLRequestViewController.swift
//  MockingInSwift
//
//  Created by dasdom on 05.06.15.
//  Copyright (c) 2015 Dominik Hauser. All rights reserved.
//

import UIKit

public class URLRequestViewController: UIViewController {

  public var session: URLSession = NSURLSession.sharedSession()
  public var user: User?
  
  public func fetchUserForUsername(username: String) {
    let url = NSURL(string: "https://api.app.net/users/@\(username)")!
    let task = session.dataTaskWithURL(url, completionHandler: { (data, response, error) -> Void in
      
      let rawDictionary = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as! [String:AnyObject]
      self.user = self.userFromDictionay(rawDictionary)
      
    })
    task.resume()
  }
  
  func userFromDictionay(dictionary: [String:AnyObject]) -> User? {
    if let rawUser = dictionary["data"] as? [String:AnyObject],
      username = rawUser["username"] as? String,
      name = rawUser["name"] as? String,
      counts = rawUser["counts"] as? [String:Int],
      followers = counts["followers"],
      following = counts["following"],
      posts = counts["posts"] {
        
        return User(username: username, name: name, numberOfPosts: posts, followers: followers, following: following)
    }
    return nil
  }
}

public protocol URLSession {
  func dataTaskWithURL(url: NSURL, completionHandler: ((NSData!, NSURLResponse!, NSError!) -> Void)?) -> NSURLSessionDataTask
}

extension NSURLSession: URLSession {
}
