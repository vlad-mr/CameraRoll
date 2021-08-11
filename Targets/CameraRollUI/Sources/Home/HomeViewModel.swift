//
//  HomeViewModel.swift
//  vladmr@pm.me
//
//  Created by Volodymyr Kravchenko on 11.08.2021.
//

import Foundation

// MARK: - HomeTab

enum HomeTab {
  case recentes
  case favourites
}

// MARK: - HomeViewAction

enum HomeViewAction {

}

// MARK: - HomeViewModel

class HomeViewModel: ViewModel {

  // MARK: Lifecycle

  init(coordinator: HomeCoordinator) {
    self.coordinator = coordinator
  }

  // MARK: Internal

  @Published var tab = HomeTab.recentes

  func action(_ action: HomeViewAction) {
    switch action {
    }
  }

  // MARK: Private

  private unowned let coordinator: HomeCoordinator
}
