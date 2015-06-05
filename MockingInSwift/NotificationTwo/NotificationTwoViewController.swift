//
//  NotificationTwoViewController.swift
//  MockingInSwift
//
//  Created by dasdom on 05.06.15.
//  Copyright (c) 2015 Dominik Hauser. All rights reserved.
//

import UIKit

public class NotificationTwoViewController: UIViewController {

  public var notificationCenter: NotificationCenter = NSNotificationCenter.defaultCenter()
  public var contentView: NotificationView {
    return view as! NotificationView
  }
  
  public override func loadView() {
    let contentView = NotificationView(frame: CGRect.zeroRect)
    
    contentView.button.addTarget(self, action: "sendNotification:", forControlEvents: .TouchUpInside)
    
    view = contentView
  }
  
  func sendNotification(sender: AnyObject) {
    notificationCenter.postNotificationName("NotificationTwo", object: self)
  }
  
}

public protocol NotificationCenter {
  func postNotificationName(aName: String, object anObject: AnyObject?)
}

extension NSNotificationCenter: NotificationCenter {
}