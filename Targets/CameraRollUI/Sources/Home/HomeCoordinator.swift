//
//  HomeCoordinator.swift
//  vladmr@pm.me
//
//  Created by Volodymyr Kravchenko on 10.08.2021.
//

import Foundation

// MARK: - HomeScene

enum HomeScene {
  case recents
  case favourites
}

// MARK: - HomeCoordinator

class HomeCoordinator: Coordinator {

  // MARK: Lifecycle

  init(parent: TabBarCoordinator) {
    self.parent = parent
    homeViewModel = HomeViewModel(coordinator: self)
  }

  // MARK: Internal

  @Published var homeViewModel: HomeViewModel!

  func show(_ scene: HomeScene) {
    switch scene {
    case .recents: print("not implemented")
    case .favourites: print("not implemented")
    }
  }

  // MARK: Private

  private unowned let parent: TabBarCoordinator
}
