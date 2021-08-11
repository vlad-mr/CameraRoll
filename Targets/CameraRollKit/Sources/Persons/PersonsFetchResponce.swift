//
//  PersonsFetchResponce.swift
//  CameraRollKit
//
//  Created by Volodymyr Kravchenko on 12.08.2021.
//  Copyright © 2021 vladmr@pm.me. All rights reserved.
//

import Foundation

struct PersonsFetchResponce: Codable {
  let results: [Person]
  let info: Info

  struct Info: Codable {
    let seed: String
    let results: Int
    let page: Int
    let version: String
  }
}
