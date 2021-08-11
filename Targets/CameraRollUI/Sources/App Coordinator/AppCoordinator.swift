//
//  Coordinator.swift
//  CameraRoll
//
//  Created by Volodymyr Kravchenko on 10.08.2021.
//

import Foundation

// MARK: - AppScene

public enum AppScene {
  case home
  case onboarding
}

// MARK: - AppCoordinator

public class AppCoordinator: Coordinator {

  // MARK: Lifecycle

  public init() {
    onboardingCoordinator = OnboardingCoordinator(parent: self)
    tabBarCoordinator = TabBarCoordinator(parent: self)
  }

  // MARK: Public

  public func show(_ scene: AppScene) {
    switch scene {
    case .home: currentScene = .home
    case .onboarding: currentScene = .onboarding
    }
  }

  // MARK: Internal

  @Published var onboardingCoordinator: OnboardingCoordinator!
  @Published var tabBarCoordinator: TabBarCoordinator!

  @Published var currentScene = AppScene.onboarding {
    willSet {
      switch newValue {
      case .onboarding: onboardingCoordinator.clearState()
      case .home: tabBarCoordinator.clearState()
      }
    }
  }
}
