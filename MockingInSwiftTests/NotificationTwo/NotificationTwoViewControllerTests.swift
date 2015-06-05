//
//  NotificationTwoViewControllerTests.swift
//  MockingInSwift
//
//  Created by dasdom on 05.06.15.
//  Copyright (c) 2015 Dominik Hauser. All rights reserved.
//

import UIKit
import XCTest
import MockingInSwift

class NotificationTwoViewControllerTests: XCTestCase {
  
  var viewController: NotificationTwoViewController!
  
  override func setUp() {
    super.setUp()
    
    viewController = NotificationTwoViewController()
    
    let _ = viewController.view
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  func testFirstNotificationIsSentWhenButtonIsClicked() {
    class MockNotificationCenter: NotificationCenter {
      
      var firstNotificationHasBeenSent = false
      
      func postNotificationName(aName: String, object anObject: AnyObject?) {
        if aName == "NotificationTwo" {
          firstNotificationHasBeenSent = true
        }
      }
    }
    
    var mockNotificationCenter = MockNotificationCenter()
    viewController.notificationCenter = mockNotificationCenter
    
    viewController.contentView.button.sendActionsForControlEvents(.TouchUpInside)
    
    XCTAssertTrue(mockNotificationCenter.firstNotificationHasBeenSent, "First notification wasn't sent")
  }
  
}
