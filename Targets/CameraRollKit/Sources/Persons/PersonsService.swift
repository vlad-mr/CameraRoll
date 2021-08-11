//
//  ImageService.swift
//  CameraRoll
//
//  Created by Volodymyr Kravchenko on 11.08.2021.
//

import Combine
import CombineMoya
import Foundation
import Moya

// MARK: - PersonsService

public final class PersonsService {

  // MARK: Lifecycle

  public init() {}

  // MARK: Public

  public func fetchPersons(limit: Int = 50) -> AnyPublisher<[Person], NetworkError> {
    provider.requestPublisher(.fetch(limit: limit), callbackQueue: .main)
      .map(PersonsFetchResponce.self)
      .map { $0.results }
      .mapInternalError()
  }

  // MARK: Internal

  let provider: MoyaProvider<PersonsTarget> = .init()
}

extension Publisher where Self.Failure == MoyaError {
  func mapInternalError() -> AnyPublisher<Self.Output, NetworkError> {
    mapError { $0.internal }
      .eraseToAnyPublisher()
  }
}
