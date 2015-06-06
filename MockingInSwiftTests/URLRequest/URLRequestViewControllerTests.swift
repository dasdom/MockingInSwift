//
//  URLRequestViewControllerTests.swift
//  MockingInSwift
//
//  Created by dasdom on 05.06.15.
//  Copyright (c) 2015 Dominik Hauser. All rights reserved.
//

import UIKit
import XCTest
import MockingInSwift

class URLRequestViewControllerTests: XCTestCase {
  
  var viewController: URLRequestViewController!
  
  override func setUp() {
    super.setUp()
    
    viewController = URLRequestViewController()
    let _ = viewController.view
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  func testFetchingOfUserSetUserProperty() {
    // Arrange
    let mockURLSession = MockURLSession()
    viewController.session = mockURLSession
    
    viewController.fetchUserForUsername("dasdom")
    let userDictionary = ["data": ["username": "dasdom", "name": "Dominik", "counts": ["followers": 11, "following": 22, "posts": 33]]] as NSDictionary
    let data = NSJSONSerialization.dataWithJSONObject(userDictionary, options: nil, error: nil)
    
    // Act
    mockURLSession.completionHandler!(data!, nil, nil)
    
    // Assert
    let testUser = User(username: "dasdom", name: "Dominik", numberOfPosts: 33, followers: 11, following: 22)
    XCTAssertTrue(viewController.user! == testUser, "should be equal")
  }
  
  class MockURLSession: URLSession {
    
    typealias Handler = (NSData!, NSURLResponse!, NSError!) -> Void
    var completionHandler: Handler?
    var url: NSURL?
    
    func dataTaskWithURL(url: NSURL, completionHandler: ((NSData!, NSURLResponse!, NSError!) -> Void)?) -> NSURLSessionDataTask {
      self.url = url
      self.completionHandler = completionHandler
      return NSURLSessionDataTask()
    }
    
  }
  
}
