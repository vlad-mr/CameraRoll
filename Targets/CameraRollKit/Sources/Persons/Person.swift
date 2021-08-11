//
//  Person.swift
//  CameraRollKit
//
//  Created by Volodymyr Kravchenko on 11.08.2021.
//  Copyright © 2021 vladmr@pm.me. All rights reserved.
//

import Foundation

public struct Person: Codable {
  public let gender: String
  public let name: Name
  public let location: Location
  public let email: String
  public let phone: String
  public let picture: Picture
  public let nat: String

  public struct Name: Codable {
    public let title: String?
    public let first: String
    public let last: String
  }

  public struct Location: Codable {
    public let city: String
    public let state: String
    public let country: String
    public let postcode: String
  }

  public struct Picture: Codable {
    public let large: String
    public let medium: String
    public let thumbnail: String
  }
}
