//
//  OnboardingCoordinatorView.swift
//  vladmr@pm.me
//
//  Created by Volodymyr Kravchenko on 11.08.2021.
//

import SwiftUI

struct OnboardingCoordinatorView: View {
  @ObservedObject var coordinator: OnboardingCoordinator

  var body: some View {
    NavigationView {
      InitialView(viewModel: coordinator.onboardingViewModel)
    }
  }
}
