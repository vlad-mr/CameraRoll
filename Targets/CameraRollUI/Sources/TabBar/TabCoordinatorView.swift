//
//  TabCoordinatorView.swift
//  vladmr@pm.me
//
//  Created by Volodymyr Kravchenko on 11.08.2021.
//

import SwiftUI

struct TabCoordinatorView: View {
  @ObservedObject var coordinator: TabCoordinator
  var body: some View {
    VStack {
      Text(coordinator.name)
    }
  }
}
