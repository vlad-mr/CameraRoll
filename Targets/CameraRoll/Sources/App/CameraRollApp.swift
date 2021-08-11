//
//  CameraRollApp.swift
//  vladmr@pm.me
//
//  Created by Volodymyr Kravchenko on 10.08.2021.
//

import SwiftUI
import CameraRollUI

// MARK: - CameraRollApp

@main
struct CameraRollApp: App {
  @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
  @StateObject var coordinator = AppCoordinator()

  var body: some Scene {
    WindowGroup {
      AppCoordinatorView(coordinator: coordinator)
    }
  }
}

// MARK: - Preview

struct Preview: PreviewProvider {
  static var previews: some View {
    AppCoordinatorView(coordinator: CameraRollApp().coordinator)
  }
}
