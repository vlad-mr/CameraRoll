//
//  OnboardingViews.swift
//  vladmr@pm.me
//
//  Created by Volodymyr Kravchenko on 11.08.2021.
//

import SwiftUI

// MARK: - Views

enum Views {
  @ViewBuilder
  static var links: some View {
    HStack(alignment: .center, spacing: 2) {
      Spacer()
      Text("Photos from ".local).font(.poppins(12))
      Link("randomuser.me".local, destination: .pictures)
        .foregroundColor(.green).font(.poppinsBold(12))
      Text(". Copyright ".local).font(.poppins(12))
      Link("link".local, destination: .faq)
        .foregroundColor(.green).font(.poppinsBold(12))
      Text(".").font(.poppins(12))
      Spacer()
    }.padding(.bottom, 50).padding(.top, 15)
  }

  @ViewBuilder
  static var logo: some View {
    Image("logo-transparent", bundle: nil)
      .resizable().scaledToFit()
      .frame(width: 400, height: 150, alignment: .center)
  }

  @ViewBuilder
  static func button(
    title: String,
    uppercased: Bool = true,
    titleColor: Color = .white,
    color: Color = .appGreen,
    action: @escaping () -> Void)
    -> some View
  {
    Button(action: action) {
      Text(uppercased ? title.uppercased() : title)
        .font(.poppinsMedium(14))
        .foregroundColor(titleColor)
        .frame(minWidth: 0, maxWidth: .infinity)
        .frame(height: 51)
        .padding([.leading, .trailing])
        .background(color.cornerRadius(5))
    }
  }

  @ViewBuilder
  static func textField(
    _ text: Binding<String>,
    error: Binding<String>? = nil,
    placeholder: String,
    font: UIFont = .poppinsMedium(14),
    placeholderFont: UIFont = .poppins(14),
    color: UIColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1),
    placeholderColor: UIColor = UIColor(red: 0.475, green: 0.475, blue: 0.475, alpha: 1),
    focusColor: UIColor = UIColor(red: 0.141, green: 0.62, blue: 0.42, alpha: 1),
    isSecure: Bool = false,
    isFocused: Bool = false,
    isFocusedBindable: Binding<Bool> = Binding.constant(false),
    onFocusChange: ((Bool) -> Void)? = nil,
    onTextChange: ((String) -> Void)? = nil)
    -> some View
  {
    FocusedTextField(
      text: text,
      error: error ?? .constant(""),
      isFocused: isFocused,
      placeholder: placeholder,
      font: font,
      placeholderFont: placeholderFont,
      color: color,
      placeholderColor: placeholderColor,
      focusedColor: focusColor,
      isSecure: isSecure,
      onFocusChange: onFocusChange,
      onTextChange: onTextChange)
  }

  @ViewBuilder
  static func back(action: @escaping () -> Void) -> some View {
    Button(action: action) {
      Image(systemName: "chevron.left")
        .padding(.trailing)
        .foregroundColor(.black)
    }
  }

  @ViewBuilder
  static func skip(action: @escaping () -> Void) -> some View {
    Button("Skip".local, action: action)
      .foregroundColor(.black)
  }

  @ViewBuilder
  static func error(_ message: String?) -> some View {
    if let message = message {
      Text(message)
        .padding([.top, .bottom], 50)
        .padding([.leading, .trailing], 20)
        .multilineTextAlignment(.center)
        .foregroundColor(.errorColor)
    } else {
      EmptyView()
    }
  }

}

extension URL {
  fileprivate static var faq: URL {
    URL(string: "https://randomuser.me/copyright")!
  }

  fileprivate static var pictures: URL {
    URL(string: "https://randomuser.me")!
  }
}
