//
//  TabCoordinator.swift
//  vladmr@pm.me
//
//  Created by Volodymyr Kravchenko on 11.08.2021.
//

import SwiftUI

// MARK: - TabCoordinator

class TabCoordinator: Coordinator {

  // MARK: Lifecycle

  init(parent: TabBarCoordinator, name: String) {
    self.parent = parent
    self.name = name
  }

  @Published var name: String

  // MARK: Private

  private unowned let parent: TabBarCoordinator

}
