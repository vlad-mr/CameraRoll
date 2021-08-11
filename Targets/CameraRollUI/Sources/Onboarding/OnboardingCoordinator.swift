//
//  OnboardingCoordinator.swift
//  vladmr@pm.me
//
//  Created by Volodymyr Kravchenko on 11.08.2021.
//

import CameraRollKit
import Foundation

// MARK: - OnboardingScene

enum OnboardingScene {
  case next
  case project
}

// MARK: - OnboardingCoordinator

class OnboardingCoordinator: Coordinator {

  // MARK: Lifecycle

  init(parent: AppCoordinator) {
    self.parent = parent
    service = ImageService()
    onboardingViewModel = OnboardingViewModel(coordinator: self, service: service)
  }

  // MARK: Internal

  @Published var onboardingViewModel: OnboardingViewModel!

  func clearState() {
    onboardingViewModel = OnboardingViewModel(coordinator: self, service: service)
  }

  func show(_ scene: OnboardingScene) {
    switch scene {
    case .next: parent.show(.home)
    case .project: print("not implemented")
    }
  }

  // MARK: Private

  private let service: ImageService
  private unowned let parent: AppCoordinator

}
