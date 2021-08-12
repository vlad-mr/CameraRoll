//
//  ImageLoader.swift
//  vladmr@pm.me
//
//  Created by Volodymyr Kravchenko on 11.08.2021.
//

import Combine
import UIKit

class ImageLoader: ObservableObject {

  // MARK: Lifecycle

  init(url: URL, cache: ImageCache? = nil) {
    self.url = url
    self.cache = cache
  }

  deinit {
    cancel()
  }

  // MARK: Internal

  @Published var image: UIImage?

  private(set) var isLoading = false

  func load() {
    guard !isLoading else { return }

    if let image = cache?[url] {
      self.image = image
      return
    }

    cancellable = URLSession.shared.dataTaskPublisher(for: url)
      .map { UIImage(data: $0.data) }
      .replaceError(with: nil)
      .handleEvents(
        receiveSubscription: { [weak self] _ in self?.onStart() },
        receiveOutput: { [weak self] in self?.cache($0) },
        receiveCompletion: { [weak self] _ in self?.onFinish() },
        receiveCancel: { [weak self] in self?.onFinish() })
      .subscribe(on: Self.imageProcessingQueue)
      .receive(on: DispatchQueue.main)
      .sink { [weak self] in self?.image = $0 }
  }

  func cancel() {
    cancellable?.cancel()
  }

  // MARK: Private

  private static let imageProcessingQueue = DispatchQueue(label: "async-image-queue")

  private let url: URL
  private var cache: ImageCache?
  private var cancellable: AnyCancellable?

  private func onStart() {
    isLoading = true
  }

  private func onFinish() {
    isLoading = false
  }

  private func cache(_ image: UIImage?) {
    image.map { cache?[url] = $0 }
  }
}
