//
//  User.swift
//  MockingInSwift
//
//  Created by dasdom on 05.06.15.
//  Copyright (c) 2015 Dominik Hauser. All rights reserved.
//

import Foundation

public struct User {
  public let username: String
  public let name: String
  public let numberOfPosts: Int
  public let followers: Int
  public let following: Int
  
  public init(username: String, name: String, numberOfPosts: Int, followers: Int, following: Int) {
    self.username = username
    self.name = name
    self.numberOfPosts = numberOfPosts
    self.followers = followers
    self.following = following
  }
}

public func ==(left: User, right: User) -> Bool {
  if left.username != right.username {
    return false
  }
  if left.name != right.name {
    return false
  }
  if left.numberOfPosts != right.numberOfPosts {
    return false
  }
  if left.followers != right.followers {
    return false
  }
  if left.following != right.following {
    return false
  }
  return true
}