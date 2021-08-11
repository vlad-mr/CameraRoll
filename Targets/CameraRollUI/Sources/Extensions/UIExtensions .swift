//
//  UIExtensions .swift
//  vladmr@pm.me
//
//  Created by Volodymyr Kravchenko on 11.08.2021.
//

import Foundation
import Localize_Swift
import SwiftUI

extension String {
  var local: String { localized() }
}

extension View {
  func onNavigation(_ action: @escaping () -> Void) -> some View {
    let isActive = Binding(
      get: { false },
      set: { newValue in
        if newValue {
          action()
        }
      })
    return NavigationLink(
      destination: EmptyView(),
      isActive: isActive) {
        self
    }
  }

  func navigation<Item, Destination: View>(
    item: Binding<Item?>,
    @ViewBuilder destination: (Item) -> Destination)
    -> some View
  {
    let isActive = Binding(
      get: { item.wrappedValue != nil },
      set: { value in
        if !value {
          item.wrappedValue = nil
        }
      })
    return navigation(isActive: isActive) {
      item.wrappedValue.map(destination)
    }
  }

  func navigation<Destination: View>(
    isActive: Binding<Bool>,
    @ViewBuilder destination: () -> Destination)
    -> some View
  {
    overlay(
      NavigationLink(
        destination: isActive.wrappedValue ? destination() : nil,
        isActive: isActive,
        label: { EmptyView() })
    )
  }
}

extension NavigationLink {
  init<T: Identifiable, D: View>(
    item: Binding<T?>,
    @ViewBuilder destination: (T) -> D,
    @ViewBuilder label: () -> Label) where Destination == D?
  {
    let isActive = Binding(
      get: { item.wrappedValue != nil },
      set: { value in
        if !value {
          item.wrappedValue = nil
        }
      })
    self.init(
      destination: item.wrappedValue.map(destination),
      isActive: isActive,
      label: label)
  }
}

// MARK: - ImageCacheKey

struct ImageCacheKey: EnvironmentKey {
  static let defaultValue: ImageCache = TemporaryImageCache()
}

extension EnvironmentValues {
  var imageCache: ImageCache {
    get { self[ImageCacheKey.self] }
    set { self[ImageCacheKey.self] = newValue }
  }
}

extension UIWindow {
  static var key: UIWindow? {
    Array(UIApplication.shared.connectedScenes)
      .compactMap { $0 as? UIWindowScene }
      .flatMap { $0.windows }
      .first(where: { $0.isKeyWindow })
  }
}

extension UIApplication {
  func endEditing() {
    sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
  }
}
