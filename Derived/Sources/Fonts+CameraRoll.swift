// swiftlint:disable all
// swift-format-ignore-file
// swiftformat:disable all
// Generated using tuist — https://github.com/tuist/tuist

#if os(OSX)
  import AppKit.NSFont
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIFont
#endif

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Fonts

// swiftlint:disable identifier_name line_length type_body_length
public enum CameraRollFontFamily {
  public enum Poppins {
    public static let black = CameraRollFontConvertible(name: "Poppins-Black", family: "Poppins", path: "Poppins-Black.ttf")
    public static let blackItalic = CameraRollFontConvertible(name: "Poppins-BlackItalic", family: "Poppins", path: "Poppins-BlackItalic.ttf")
    public static let bold = CameraRollFontConvertible(name: "Poppins-Bold", family: "Poppins", path: "Poppins-Bold.ttf")
    public static let boldItalic = CameraRollFontConvertible(name: "Poppins-BoldItalic", family: "Poppins", path: "Poppins-BoldItalic.ttf")
    public static let extraBold = CameraRollFontConvertible(name: "Poppins-ExtraBold", family: "Poppins", path: "Poppins-ExtraBold.ttf")
    public static let extraBoldItalic = CameraRollFontConvertible(name: "Poppins-ExtraBoldItalic", family: "Poppins", path: "Poppins-ExtraBoldItalic.ttf")
    public static let extraLight = CameraRollFontConvertible(name: "Poppins-ExtraLight", family: "Poppins", path: "Poppins-ExtraLight.ttf")
    public static let extraLightItalic = CameraRollFontConvertible(name: "Poppins-ExtraLightItalic", family: "Poppins", path: "Poppins-ExtraLightItalic.ttf")
    public static let italic = CameraRollFontConvertible(name: "Poppins-Italic", family: "Poppins", path: "Poppins-Italic.ttf")
    public static let light = CameraRollFontConvertible(name: "Poppins-Light", family: "Poppins", path: "Poppins-Light.ttf")
    public static let lightItalic = CameraRollFontConvertible(name: "Poppins-LightItalic", family: "Poppins", path: "Poppins-LightItalic.ttf")
    public static let medium = CameraRollFontConvertible(name: "Poppins-Medium", family: "Poppins", path: "Poppins-Medium.ttf")
    public static let mediumItalic = CameraRollFontConvertible(name: "Poppins-MediumItalic", family: "Poppins", path: "Poppins-MediumItalic.ttf")
    public static let regular = CameraRollFontConvertible(name: "Poppins-Regular", family: "Poppins", path: "Poppins-Regular.ttf")
    public static let semiBold = CameraRollFontConvertible(name: "Poppins-SemiBold", family: "Poppins", path: "Poppins-SemiBold.ttf")
    public static let semiBoldItalic = CameraRollFontConvertible(name: "Poppins-SemiBoldItalic", family: "Poppins", path: "Poppins-SemiBoldItalic.ttf")
    public static let thin = CameraRollFontConvertible(name: "Poppins-Thin", family: "Poppins", path: "Poppins-Thin.ttf")
    public static let thinItalic = CameraRollFontConvertible(name: "Poppins-ThinItalic", family: "Poppins", path: "Poppins-ThinItalic.ttf")
    public static let all: [CameraRollFontConvertible] = [black, blackItalic, bold, boldItalic, extraBold, extraBoldItalic, extraLight, extraLightItalic, italic, light, lightItalic, medium, mediumItalic, regular, semiBold, semiBoldItalic, thin, thinItalic]
  }
  public static let allCustomFonts: [CameraRollFontConvertible] = [Poppins.all].flatMap { $0 }
  public static func registerAllCustomFonts() {
    allCustomFonts.forEach { $0.register() }
  }
}
// swiftlint:enable identifier_name line_length type_body_length

// MARK: - Implementation Details

public struct CameraRollFontConvertible {
  public let name: String
  public let family: String
  public let path: String

  #if os(OSX)
  public typealias Font = NSFont
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  public typealias Font = UIFont
  #endif

  public func font(size: CGFloat) -> Font {
    guard let font = Font(font: self, size: size) else {
      fatalError("Unable to initialize font '\(name)' (\(family))")
    }
    return font
  }

  public func register() {
    // swiftlint:disable:next conditional_returns_on_newline
    guard let url = url else { return }
    CTFontManagerRegisterFontsForURL(url as CFURL, .process, nil)
  }

  fileprivate var url: URL? {
    // swiftlint:disable:next implicit_return
    return BundleToken.bundle.url(forResource: path, withExtension: nil)
  }
}

public extension CameraRollFontConvertible.Font {
  convenience init?(font: CameraRollFontConvertible, size: CGFloat) {
    #if os(iOS) || os(tvOS) || os(watchOS)
    if !UIFont.fontNames(forFamilyName: font.family).contains(font.name) {
      font.register()
    }
    #elseif os(OSX)
    if let url = font.url, CTFontManagerGetScopeForURL(url as CFURL) == .none {
      font.register()
    }
    #endif

    self.init(name: font.name, size: size)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    Bundle(for: BundleToken.self)
  }()
}
// swiftlint:enable convenience_type
// swiftlint:enable all
// swiftformat:enable all
