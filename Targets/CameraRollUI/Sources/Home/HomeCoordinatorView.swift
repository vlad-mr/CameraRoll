//
//  HomeCoordinatorView.swift
//  vladmr@pm.me
//
//  Created by Volodymyr Kravchenko on 11.08.2021.
//

import SwiftUI

struct HomeCoordinatorView: View {
  @ObservedObject var coordinator: HomeCoordinator

  var body: some View {
    HomeView(viewModel: coordinator.homeViewModel)
  }
}
