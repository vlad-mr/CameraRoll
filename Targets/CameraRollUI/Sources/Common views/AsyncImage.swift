//
//  AsyncImage.swift
//  vladmr@pm.me
//
//  Created by Volodymyr Kravchenko on 11.08.2021.
//

import CameraRollKit
import SwiftUI

struct AsyncImage<Placeholder: View>: View {

  // MARK: Lifecycle

  init(
    url: URL,
    @ViewBuilder placeholder: () -> Placeholder,
    @ViewBuilder image: @escaping (UIImage) -> Image = Image.init(uiImage:))
  {
    self.placeholder = placeholder()
    self.image = image
    _loader = StateObject(wrappedValue: ImageLoader(url: url, cache: Environment(\.imageCache).wrappedValue))
  }

  // MARK: Internal

  var body: some View {
    content.onAppear(perform: loader.load)
  }

  // MARK: Private

  @StateObject private var loader: ImageLoader
  private let placeholder: Placeholder
  private let image: (UIImage) -> Image

  private var content: some View {
    Group {
      if loader.image != nil {
        image(loader.image!)
      } else {
        placeholder
      }
    }
  }
}
