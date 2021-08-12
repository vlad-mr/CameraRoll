//
//  ImageLoader.swift
//  vladmr@pm.me
//
//  Created by Volodymyr Kravchenko on 11.08.2021.
//

import Combine
import UIKit

// MARK: - ImageLoader

public class ImageLoader: ObservableObject {

  // MARK: Lifecycle

  public init(url: URL, cache: ImageCache? = nil) {
    self.url = url
    self.cache = cache
  }

  deinit {
    cancel()
  }

  // MARK: Public

  @Published public var image: UIImage?

  public private(set) var isLoading = false

  public func load() {
    guard !isLoading else { return }
    if let image = cache?[url] {
      self.image = image
      return
    }
    cancellable = sharedSession.dataTaskPublisher(for: url)
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

  public func cancel() {
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

/// Ephemeral URL session object shared between instances of ImageLoader.
///
/// As we have our own cache, use of ephemeral URL session will increase performance because it doesn't store caches.
private let sharedSession: URLSession = {
  let configuration = URLSessionConfiguration.ephemeral
  configuration.isDiscretionary = false
  return URLSession(configuration: configuration)
}()
