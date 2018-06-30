//
//  Enum.swift
//  IncubatorGameProject
//
//  Created by Жанибек on 30.06.18.
//  Copyright © 2018 Жанибек. All rights reserved.
//

import Foundation
import UIKit
struct Colors{
  
  static let red        = UIColor(red: 255.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
  static let black      = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
  static let gray      = UIColor(red: 128.0/255.0, green: 128.0/255.0, blue: 128.0/255.0, alpha: 1.0)
//  static let white     = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)
//  static let green     = UIColor(red: 34.0/255.0, green: 139.0/255.0, blue: 34.0/255.0, alpha: 1.0)
  static let darkGray  = UIColor(red: 169.0/255.0, green: 169.0/255.0, blue: 169.0/255.0,alpha: 1.0)
  static let blue       = UIColor(red: 30.0/255.0, green: 144.0/255.0, blue: 255.0/255.0, alpha: 1.0)
  
  
  
  var colors: [UIColor: String]  = [red:"Red",black:"Black",gray:"Gray", darkGray:"Dark gray",blue:"Blue"]

  var colorArray:Array<UIColor>?
  var colorName:Array<String>?
  
  init() {
    self.colorArray = Array(colors.keys)
    self.colorName = Array(colors.values)
  }
  
  public func getText(color: UIColor) -> UIColor {
    var textColor: UIColor
    repeat {
      textColor = (colorArray?.randomColor())!
    } while (textColor == color)
    return textColor
  }
  
}
