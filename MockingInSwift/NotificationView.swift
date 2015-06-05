//
//  NotificationView.swift
//  MockingInSwift
//
//  Created by dasdom on 05.06.15.
//  Copyright (c) 2015 Dominik Hauser. All rights reserved.
//

import UIKit

public class NotificationView: UIView {

  public let button: UIButton
  
  override init(frame: CGRect) {
    button = UIButton.buttonWithType(.System) as! UIButton
    button.setTranslatesAutoresizingMaskIntoConstraints(false)
    button.setTitle("Send Notification", forState: .Normal)
    
    super.init(frame: frame)
    backgroundColor = UIColor.whiteColor()
    
    addSubview(button)
    
    NSLayoutConstraint(item: button, attribute: .CenterX, relatedBy: .Equal, toItem: self, attribute: .CenterX, multiplier: 1.0, constant: 0.0).active = true
    NSLayoutConstraint(item: button, attribute: .CenterY, relatedBy: .Equal, toItem: self, attribute: .CenterY, multiplier: 1.0, constant: 0.0).active = true
  }
  
  required public init(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}
