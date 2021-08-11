//
//  AppCoordinatorView.swift
//  vladmr@pm.me
//
//  Created by Volodymyr Kravchenko on 11.08.2021.
//

import SwiftUI

public struct AppCoordinatorView: View {
  @ObservedObject var coordinator: AppCoordinator

  public init(coordinator: AppCoordinator) {
    self.coordinator = coordinator
  }

  public var body: some View {
    Group {
      switch coordinator.currentScene {
      case .home: TabBarCoordinatorView(coordinator: coordinator.tabBarCoordinator)
      case .onboarding: OnboardingCoordinatorView(coordinator: coordinator.onboardingCoordinator)
      }
    }
  }
}
