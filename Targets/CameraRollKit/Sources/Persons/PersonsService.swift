//
//  ImageService.swift
//  CameraRoll
//
//  Created by Volodymyr Kravchenko on 11.08.2021.
//

import Foundation
import Moya
import CombineMoya
import Combine

public final class PersonsService {
  let provider: MoyaProvider<PersonsTarget> = .init()
  public init() {}

  public func fetchPersons(limit: Int = 50) -> AnyPublisher<[Person], NetworkError> {
    provider.requestPublisher(.fetch(limit: limit), callbackQueue: .main)
      .map(PersonsFetchResponce.self)
      .map { $0.results }
      .mapInternalError()
  }
}

extension Publisher where Self.Failure == MoyaError {
  func mapInternalError() -> AnyPublisher<Self.Output, NetworkError> {
    return self
      .mapError { $0.internal }
      .eraseToAnyPublisher()
  }
}
