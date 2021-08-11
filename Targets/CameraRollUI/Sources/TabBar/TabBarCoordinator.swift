//
//  TabBarCoordinator.swift
//  vladmr@pm.me
//
//  Created by Volodymyr Kravchenko on 11.08.2021.
//

import Foundation

// MARK: - Tab

public enum Tab {
  case all
  case albums
  case search
}

// MARK: - TabBarCoordinator

class TabBarCoordinator: Coordinator {

  // MARK: Lifecycle

  init(parent: AppCoordinator) {
    self.parent = parent
    homeCoordinator = HomeCoordinator(parent: self)
  }

  // MARK: Internal

  @Published var tab = Tab.all
  @Published var homeCoordinator: HomeCoordinator!
  @Published var albumsCoordinator: TabCoordinator!
  @Published var searchCoordinator: TabCoordinator!

  func clearState() {
    homeCoordinator = HomeCoordinator(parent: self)
    albumsCoordinator = TabCoordinator(parent: self, name: "Albums")
    searchCoordinator = TabCoordinator(parent: self, name: "Search")
    tab = .all
  }

  unowned let parent: AppCoordinator
}
