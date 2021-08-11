//
//  CameraRollApp.swift
//  vladmr@pm.me
//
//  Created by Volodymyr Kravchenko on 10.08.2021.
//

import CameraRollUI
import SwiftUI
import PartialSheet

// MARK: - CameraRollApp

@main
struct CameraRollApp: App {
  @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
  @StateObject var coordinator = AppCoordinator()
  private let sheetManager = PartialSheetManager()

  var body: some Scene {
    WindowGroup {
      AppCoordinatorView(coordinator: coordinator)
        .preferredColorScheme(.light)
        .environmentObject(sheetManager)
    }
  }
}

// MARK: - Preview

struct Preview: PreviewProvider {
  static var previews: some View {
    AppCoordinatorView(coordinator: CameraRollApp().coordinator)
  }
}
