//
//  OnboardingViewModel.swift
//  vladmr@pm.me
//
//  Created by Volodymyr Kravchenko on 11.08.2021.
//

import Combine
import Foundation
import CameraRollKit

// MARK: - OnboardingViewModel

class OnboardingViewModel: ViewModel {

  // MARK: Lifecycle

  init(coordinator: OnboardingCoordinator, service: ImageService) {
    self.coordinator = coordinator
    self.service = service
  }

  // MARK: Internal

  unowned let coordinator: OnboardingCoordinator
  @Published var images: [String] = ["brand"]

  func action(_ action: InitialViewAction) {
    switch action {
    case .skip: coordinator.show(.next)
    }
  }

  func navigate(_ action: NavigationAction) {
    switch action {
    case .next: coordinator.show(.next)
    case .back: print("no back action here")
    }
  }

  // MARK: Private

  private let service: ImageService
}
