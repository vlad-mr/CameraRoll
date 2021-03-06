//
//  TabBarCoordinatorView.swift
//  vladmr@pm.me
//
//  Created by Volodymyr Kravchenko on 11.08.2021.
//

import SwiftUI

struct TabBarCoordinatorView: View {

  @ObservedObject var coordinator: TabBarCoordinator

  var body: some View {
    NavigationView {
      TabView(selection: $coordinator.tab) {
        HomeCoordinatorView(coordinator: coordinator.homeCoordinator)
          .tabItem { Label("All".local, systemImage: "rectangle.grid.2x2.fill") }
          .tag(Tab.all)
        TabCoordinatorView(coordinator: coordinator.albumsCoordinator)
          .tabItem { Label("Albums".local, systemImage: "rectangle.grid.1x2.fill") }
          .tag(Tab.albums)
        TabCoordinatorView(coordinator: coordinator.searchCoordinator)
          .tabItem { Label("Search".local, image: "search") }
          .tag(Tab.search)
      }
      .accentColor(.appGreen)
      .navigationBarItems(leading: Views.logo)
      .navigationBarTitleDisplayMode(.inline)
    }
  }
}
