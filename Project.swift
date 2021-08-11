import Foundation
import ProjectDescription
import ProjectDescriptionHelpers

/*
                +-------------+
                |             |
                |     App     | Contains CameraRoll App target and CameraRoll unit-test target
                |             |
         +------+-------------+-------+
         |         depends on         |
         |                            |
 +----v-----+                   +-----v-----+
 |          |                   |           |
 |   Kit    |                   |     UI    |
 |          |                   |           |
 +----------+                   +-----------+

 */

// MARK: - Project

let infoPlist: [String: InfoPlist.Value] = [
  "CFBundleShortVersionString": "1.0",
  "CFBundleVersion": "1",
  "UILaunchScreen": [:],
  "UIAppFonts": .array([
    .string("Poppins-Black.ttf"),
    .string("Poppins-BlackItalic.ttf"),
    .string("Poppins-Bold.ttf"),
    .string("Poppins-BoldItalic.ttf"),
    .string("Poppins-ExtraBold.ttf"),
    .string("Poppins-ExtraBoldItalic.ttf"),
    .string("Poppins-ExtraLight.ttf"),
    .string("Poppins-ExtraLightItalic.ttf"),
    .string("Poppins-Italic.ttf"),
    .string("Poppins-Light.ttf"),
    .string("Poppins-LightItalic.ttf"),
    .string("Poppins-Medium.ttf"),
    .string("Poppins-MediumItalic.ttf"),
    .string("Poppins-Regular.ttf"),
    .string("Poppins-SemiBold.ttf"),
    .string("Poppins-SemiBoldItalic.ttf"),
    .string("Poppins-Thin.ttf"),
    .string("Poppins-ThinItalic.ttf"),
  ]),
]
let bundleId = "vladmr.pm.me.CameraRoll"
let deploymentTarget = DeploymentTarget.iOS(targetVersion: "14.0", devices: .iphone)
let kit = Project.makeFrameworkTargets(
  name: "CameraRollKit",
  platform: .iOS,
  appBundleId: bundleId,
  deploymentTarget: deploymentTarget,
  dependencies: [
    .package(product: "Moya"),
    .package(product: "CombineMoya")
  ])
let uiTarget = Project.makeFrameworkTargets(
  name: "CameraRollUI",
  platform: .iOS,
  appBundleId: bundleId,
  deploymentTarget: deploymentTarget,
  dependencies: [
    .target(name: "CameraRollKit"),
    .package(product: "SwiftDateStatic"),
    .package(product: "Localize_Swift"),
    .package(product: "PartialSheet")
  ])
let app = Project.makeAppTargets(
  name: "CameraRoll",
  infoPlist: infoPlist,
  bundleId: bundleId,
  deploymentTarget: deploymentTarget,
  dependencies: [
    .target(name: "CameraRollUI"),
  ])

let project = Project(
  name: "Camera Roll",
  organizationName: "vladmr@pm.me",
  packages: [
    .remote(
      url: "https://github.com/malcommac/SwiftDate.git",
      requirement: .upToNextMajor(from: "6.0.0")),
    .remote(
      url: "https://github.com/marmelroy/Localize-Swift.git",
      requirement: .upToNextMajor(from: "3.2.0")),
    .remote(
      url: "https://github.com/Moya/Moya",
      requirement: .branch("development")),
    .remote(url: "https://github.com/AndreaMiotto/PartialSheet",
            requirement: .upToNextMajor(from: "2.0.0"))
  ],
  targets: app + kit + uiTarget)
