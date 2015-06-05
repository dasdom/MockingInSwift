//
//  NotificationOneViewControllerTests.swift
//  MockingInSwift
//
//  Created by dasdom on 05.06.15.
//  Copyright (c) 2015 Dominik Hauser. All rights reserved.
//

import UIKit
import XCTest
import MockingInSwift

class NotificationOneViewControllerTests: XCTestCase {

  var viewController: NotificationOneViewController!
  
  override func setUp() {
    super.setUp()
    
    viewController = NotificationOneViewController()
    
    let _ = viewController.view
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  func testNotificationOneIsSentWhenButtonIsPressed() {
    class MockOneNotificationCenter : NSNotificationCenter {
      
      var notificationOneHasBeenSent = false
      
      override func postNotificationName(aName: String, object anObject: AnyObject?) {
        if aName == "NotificationOne" {
          notificationOneHasBeenSent = true
        }
      }
    }
    
    let mockNotificationCenter = MockOneNotificationCenter()
    viewController.notificationCenter = mockNotificationCenter
    
    viewController.contentView.button.sendActionsForControlEvents(.TouchUpInside)
    
    XCTAssertTrue(mockNotificationCenter.notificationOneHasBeenSent, "Notification should be sent")
  }

}
