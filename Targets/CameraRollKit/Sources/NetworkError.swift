//
//  NetworkError.swift
//  CameraRollKit
//
//  Created by Volodymyr Kravchenko on 11.08.2021.
//  Copyright © 2021 vladmr@pm.me. All rights reserved.
//

import Foundation
import Moya

public enum NetworkError: Error, Equatable {
  case mapping(String)
  case statusCode(String)
  case encoding(String)
  case underlying(String)

  public var localizedDescription: String {
    switch self {
    case .mapping(let string): return "Mapping error: " + string
    case .statusCode(let string): return "Wrong status code: " + string
    case .encoding(let string): return "Wrong encoding: " + string
    case .underlying(let string): return string
    }
  }
}

extension MoyaError {
  var `internal`: NetworkError {
    switch self {
    case .imageMapping(let response),
        .jsonMapping(let response),
        .stringMapping(let response): return .mapping(response.description)
    case .requestMapping(let string): return .mapping(string)
    case .objectMapping(let error, _): return .mapping(String(describing: error))
    case .encodableMapping(let error): return .mapping(String(describing: error))
    case .statusCode(let response): return .statusCode(response.description)
    case .underlying(let error, _): return .underlying(String(describing: error))
    case .parameterEncoding(let error): return .encoding(String(describing: error))
    }
  }
}
