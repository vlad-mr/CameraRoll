//
//  CollectionExtensions.swift
//  vladmr@pm.me
//
//  Created by Volodymyr Kravchenko on 11.08.2021.
//

import Foundation

extension Optional {
  func orThrow(_ errorExpression: @autoclosure () -> Error) throws -> Wrapped {
    guard let value = self else {
      throw errorExpression()
    }
    return value
  }
}

extension Optional where Wrapped: Collection {
  var isNilOrEmpty: Bool {
    if case .some(let value) = self, !value.isEmpty { return false }
    return true
  }
}

extension Collection where Indices.Iterator.Element == Index {
  /// Returns the element at the specified index if it is within bounds, otherwise nil.
  subscript (safe index: Index) -> Iterator.Element? {
    indices.contains(index) ? self[index] : nil
  }
}

extension Sequence {

  // MARK: Public

  public func flatMap<T>(_ keyPath: KeyPath<Element.Element, T>) -> [T] where Element: Sequence {
    flat.map { $0[keyPath: keyPath] }
  }

  // MARK: Internal

  /// Returns an array containing the values for specified key path.
  ///
  /// - Parameter keyPath: key path to property
  func map<T>(_ keyPath: KeyPath<Element, T>) -> [T] {
    map { $0[keyPath: keyPath] }
  }

  /// Returns an array containing the non-nil values for specified key path.
  ///
  /// - Parameter keyPath: key path to property
  func compactMap<T>(_ keyPath: KeyPath<Element, T?>) -> [T] {
    compactMap { $0[keyPath: keyPath] }
  }

}

extension Sequence where Element: Sequence {
  /// Returns a single-level collection
  var flat: [Element.Element] { flatMap { $0 } }
}
