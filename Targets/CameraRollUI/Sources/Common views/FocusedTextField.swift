//
//  FocusedTextField.swift
//  vladmr@pm.me
//
//  Created by Volodymyr Kravchenko on 11.08.2021.
//

import Combine
import SwiftUI

struct FocusedTextField: View {
  @Binding var text: String
  @Binding var error: String
  @State var isFocused: Bool = false

  var placeholder: String
  var font: UIFont
  var placeholderFont: UIFont
  var color: UIColor
  var placeholderColor: UIColor
  var focusedColor: UIColor = .clear
  var isSecure: Bool = false
  var onFocusChange: ((Bool) -> Void)? = nil
  var onTextChange: ((String) -> Void)? = nil

  var body: some View {
    VStack(alignment: .leading, spacing: 12) {
      CustomTextField(
        text: $text,
        error: $error,
        placeholder: placeholder,
        font: font,
        placeholderFont: placeholderFont,
        color: color,
        placeholderColor: placeholderColor,
        isSecure: isSecure,
        isFocused: isFocused,
        isFocusedBindable: $isFocused,
        onFocusChange: onFocusChange)
        .onChange(of: text, perform: onTextChange ?? { _ in })
        .frame(minWidth: 0, maxWidth: .infinity)
        .frame(height: 30)
        .padding()
        .background(RoundedRectangle(cornerRadius: 5)
          .stroke(isFocused ? Color(focusedColor) : error.isEmpty ? .clear : .errorColor)
          .background(RoundedRectangle(cornerRadius: 5)
            .foregroundColor(Color(UIColor(
              red: 249/255,
              green: 248/255,
              blue: 242/255,
              alpha: 1)))))
      if !error.isEmpty {
        HStack(alignment: .top, spacing: 5) {
          Image("error").padding(.top, 2)
          Text(error)
            .font(.system(size: 13))
            .foregroundColor(.errorColor)
        }
      }
    }
  }
}

