//
//  ColorExtensions.swift
//  CameraRollKit
//
//  Created by Volodymyr Kravchenko on 12.08.2021.
//  Copyright © 2021 vladmr@pm.me. All rights reserved.
//

import SwiftUI

extension Color {
  public static var appGreen: Color {
    Color(UIColor.appGreen)
  }

  public static var appGreenLight: Color {
    Color(UIColor.appGreenLight)
  }

  public static var infoTextColor: Color {
    Color(UIColor.infoTextColor)
  }

  public static var errorColor: Color {
    Color(UIColor.errorColor)
  }
}

extension UIColor {
  public static var appGreen: UIColor {
    UIColor(red: 36/255, green: 158/255, blue: 107/255, alpha: 1)
  }

  public static var appGreenLight: UIColor {
    UIColor.appGreen.withAlphaComponent(0.2)
  }

  public static var infoTextColor: UIColor {
    UIColor(red: 0.35, green: 0.35, blue: 0.35, alpha: 1)
  }

  public static var errorColor: UIColor {
    UIColor(red: 0.827, green: 0.11, blue: 0.11, alpha: 1)
  }
}
