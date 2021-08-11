//
//  ViewModel.swift
//  vladmr@pm.me
//
//  Created by Volodymyr Kravchenko on 11.08.2021.
//

import Foundation

// MARK: - NavigationAction

public enum NavigationAction {
  case next
  case back
}

// MARK: - ViewModel

public protocol ViewModel: ObservableObject, Identifiable {
  func navigate(_ action: NavigationAction)
}

public extension ViewModel {
  func navigate(_: NavigationAction) {
    print("No action for this screen")
  }
}
