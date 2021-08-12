//
//  ImageCache.swift
//  vladmr@pm.me
//
//  Created by Volodymyr Kravchenko on 11.08.2021.
//

import UIKit

// MARK: - ImageCache

public protocol ImageCache {
  subscript(_ url: URL) -> UIImage? { get set }
}

// MARK: - TemporaryImageCache

public struct TemporaryImageCache: ImageCache {
  public init() {}
  
  private let cache: NSCache<NSURL, UIImage> = {
    let cache = NSCache<NSURL, UIImage>()
    cache.countLimit = 100
    cache.totalCostLimit = 1024 * 1024 * 100
    return cache
  }()

  public subscript(_ key: URL) -> UIImage? {
    get { cache.object(forKey: key as NSURL) }
    set { newValue == nil
      ? cache.removeObject(forKey: key as NSURL)
      : cache.setObject(newValue!, forKey: key as NSURL) }
  }
}
