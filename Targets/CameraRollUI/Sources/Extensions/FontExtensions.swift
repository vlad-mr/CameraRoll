//
//  FontExtensions.swift
//  vladmr@pm.me
//
//  Created by Volodymyr Kravchenko on 12.07.2021.
//

import Foundation
import SwiftUI

extension Font {
  static func poppinsBold(_ size: CGFloat = 13) -> Font { .custom("Poppins-Bold", size: size) }
  static func poppins(_ size: CGFloat = 13) -> Font { .custom("Poppins-Regular", size: size) }
  static func poppinsMedium(_ size: CGFloat = 13) -> Font { .custom("Poppins-Medium", size: size) }
}

extension UIFont {
  static func poppinsBold(_ size: CGFloat = 13) -> UIFont { UIFont(name: "Poppins-Bold", size: size)! }
  static func poppins(_ size: CGFloat = 13) -> UIFont { UIFont(name: "Poppins-Regular", size: size)! }
  static func poppinsMedium(_ size: CGFloat = 13) -> UIFont { UIFont(name: "Poppins-Medium", size: size)! }
}
