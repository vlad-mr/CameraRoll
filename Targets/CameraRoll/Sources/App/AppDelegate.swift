import CameraRollKit
import CameraRollUI
import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {
  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil)
    -> Bool
  {
    UIScrollView.appearance().keyboardDismissMode = .interactive
    UserDefaults.standard.set(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
    CameraRollKit.hello()
    CameraRollUI.hello()

    return true
  }
}
