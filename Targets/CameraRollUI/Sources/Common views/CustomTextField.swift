//
//  FocusingTextField.swift
//  vladmr@pm.me
//
//  Created by Volodymyr Kravchenko on 11.08.2021.
//

import Combine
import SwiftUI

struct CustomTextField: UIViewRepresentable {

  class Coordinator: NSObject, UITextFieldDelegate {

    // MARK: Lifecycle

    init(text: Binding<String>, error: Binding<String>, isFocused: Binding<Bool>) {
      _text = text
      _error = error
      _isFocused = isFocused
    }

    // MARK: Internal

    @Binding var text: String
    @Binding var error: String
    @Binding var isFocused: Bool

    var didBecomeFirstResponder = false
    var onFocusChange: ((Bool) -> Void)?

    func textFieldDidChangeSelection(_ textField: UITextField) {
      text = textField.text ?? ""
      error = ""
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
      onFocusChange?(false)
      isFocused = false
      didBecomeFirstResponder = false
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
      onFocusChange?(true)
      isFocused = true
      didBecomeFirstResponder = true
    }
  }

  @Binding var text: String
  @Binding var error: String
  var placeholder: String
  var font: UIFont?
  var placeholderFont: UIFont?
  var color: UIColor?
  var placeholderColor: UIColor?
  var isSecure: Bool = false
  var isFocused: Bool = false
  @Binding var isFocusedBindable: Bool
  var onFocusChange: ((Bool) -> Void)?

  func makeUIView(context: UIViewRepresentableContext<CustomTextField>) -> UITextField {
    let textField = UITextField(frame: .zero)
    textField.delegate = context.coordinator
    return textField
  }

  func makeCoordinator() -> CustomTextField.Coordinator {
    let coordinator = Coordinator(text: $text, error: $error, isFocused: $isFocusedBindable)
    coordinator.onFocusChange = onFocusChange
    return coordinator
  }

  func updateUIView(_ uiView: UITextField, context: UIViewRepresentableContext<CustomTextField>) {
    uiView.text = text
    uiView.font = font
    uiView.textColor = color
    uiView.isSecureTextEntry = isSecure
    uiView.autocapitalizationType = .none
    uiView.autocorrectionType = .no
    if let font = placeholderFont, let color = placeholderColor {
      uiView.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [
        .font: font, .foregroundColor: color,
      ])
    } else {
      uiView.placeholder = placeholder
    }
    if (isFocusedBindable || isFocused) && !context.coordinator.didBecomeFirstResponder {
      uiView.becomeFirstResponder()
      context.coordinator.didBecomeFirstResponder = true
    }
  }
}
