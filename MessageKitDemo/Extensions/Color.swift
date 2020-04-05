//
//  Color.swift
//  MessageKitDemo
//
//  Created by Raghad'Mac on 11/16/19.
//  Copyright © 2019 Raghad'Mac. All rights reserved.
//

import Foundation
import UIKit



extension UIColor {
  static var random: UIColor {
    return UIColor(
      red: CGFloat.random(in: 0...1),
      green: CGFloat.random(in: 0...1),
      blue: CGFloat.random(in: 0...1),
      alpha: 1)
  }
}
