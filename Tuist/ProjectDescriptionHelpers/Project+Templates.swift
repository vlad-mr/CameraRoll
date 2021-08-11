import ProjectDescription

/// Project helpers are functions that simplify the way you define your project.
/// Share code to create targets, settings, dependencies,
/// Create your own conventions, e.g: a func that makes sure all shared targets are "static frameworks"
/// See https://docs.tuist.io/guides/helpers/

extension Project {
  /// Helper function to create the Project for this ExampleApp
  public static func app(name: String,
                         platform: Platform,
                         bundleId: String,
                         deploymentTarget: DeploymentTarget,
                         additionalTargets: [String]) -> Project {
    var targets = makeAppTargets(name: name,
                                 platform: platform,
                                 infoPlist: [:],
                                 bundleId: bundleId,
                                 deploymentTarget: deploymentTarget,
                                 dependencies: additionalTargets.map { TargetDependency.target(name: $0) })
    targets += additionalTargets.flatMap({
      makeFrameworkTargets(name: $0,
                           platform: platform,
                           appBundleId: bundleId,
                           deploymentTarget: deploymentTarget)
    })
    return Project(name: name,
                   organizationName: "tuist.io",
                   targets: targets)
  }

  // MARK: - Private

  /// Helper function to create a framework target and an associated unit test target
  public static func makeFrameworkTargets(name: String,
                                          platform: Platform,
                                          appBundleId: String,
                                          deploymentTarget: DeploymentTarget,
                                          dependencies: [TargetDependency] = []) -> [Target] {
    let sources = Target(name: name,
                         platform: platform,
                         product: .framework,
                         bundleId: appBundleId + "." + name,
                         deploymentTarget: deploymentTarget,
                         infoPlist: .default,
                         sources: ["Targets/\(name)/Sources/**"],
                         resources: [],
                         dependencies: dependencies)
    let tests = Target(name: "\(name)Tests",
                       platform: platform,
                       product: .unitTests,
                       bundleId: "\(appBundleId).\(name)Tests",
                       deploymentTarget: deploymentTarget,
                       infoPlist: .default,
                       sources: ["Targets/\(name)/Tests/**"],
                       resources: [],
                       dependencies: [.target(name: name)])
    return [sources, tests]
  }

  /// Helper function to create the application target and the unit test target.
  public static func makeAppTargets(name: String,
                                    platform: Platform,
                                    infoPlist: [String: InfoPlist.Value],
                                    bundleId: String,
                                    deploymentTarget: DeploymentTarget,
                                    dependencies: [TargetDependency]) -> [Target] {
    let platform: Platform = platform

    let mainTarget = Target(
      name: name,
      platform: platform,
      product: .app,
      bundleId: bundleId,
      deploymentTarget: deploymentTarget,
      infoPlist: .extendingDefault(with: infoPlist),
      sources: ["Targets/\(name)/Sources/**"],
      resources: ["Targets/\(name)/Resources/**"],
      dependencies: dependencies
    )

    let testTarget = Target(
      name: "\(name)Tests",
      platform: platform,
      product: .unitTests,
      bundleId: "\(bundleId).\(name)Tests",
      infoPlist: .default,
      sources: ["Targets/\(name)/Tests/**"],
      dependencies: [
        .target(name: "\(name)")
      ])
    return [mainTarget, testTarget]
  }
}
