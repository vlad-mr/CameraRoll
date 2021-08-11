//
//  PersonsTarget.swift
//  CameraRollKit
//
//  Created by Volodymyr Kravchenko on 11.08.2021.
//  Copyright © 2021 vladmr@pm.me. All rights reserved.
//

import Foundation
import Moya

enum PersonsTarget {
  case fetch(limit: Int)

  private var limit: Int {
    switch self {
    case .fetch(let limit): return limit
    }
  }
}

extension PersonsTarget: TargetType {
  var baseURL: URL { URL(string: "https://randomuser.me/")! }
  var path: String { "api" }
  var headers: [String : String]? { ["Content-type": "application/json"] }
  var method: Moya.Method { .get }
  var task: Moya.Task {
    .requestParameters(parameters: ["results": limit], encoding: URLEncoding.queryString)
  }
  var sampleData: Data {
    guard let url = Bundle.main.url(forResource: "persons", withExtension: "json"),
          let data = try? Data(contentsOf: url) else { return Data() }
    return data
  }
}
