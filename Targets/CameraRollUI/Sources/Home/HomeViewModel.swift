//
//  HomeViewModel.swift
//  vladmr@pm.me
//
//  Created by Volodymyr Kravchenko on 11.08.2021.
//

import Foundation
import CameraRollKit
import Combine

// MARK: - HomeTab

enum HomeTab: Equatable {
  case recentes
  case favourites
}

// MARK: - HomeViewAction

enum HomeViewAction {
  case fetch
  case refresh
  case select(Person)
  case share(Person)
}

// MARK: - HomeViewModel

class HomeViewModel: ViewModel {

  // MARK: Lifecycle

  init(coordinator: HomeCoordinator, service: PersonsService) {
    self.coordinator = coordinator
    self.service = service
  }

  // MARK: Internal

  @Published var tab = HomeTab.recentes
  @Published var persons: [Person] = []
  @Published var hasError: Bool = false
  @Published var error: NetworkError? {
    didSet {
      if let error = error {
        print(error.localizedDescription)
      }
      hasError = error != nil
    }
  }

  func action(_ action: HomeViewAction) {
    switch action {
    case .fetch: fetchPersons()
    case .refresh: print("Refresh")
    case .select(let person): print("Select " + person.email)
    case .share(let person): print("Share " + person.email)
    }
  }

  // MARK: Private

  private unowned let coordinator: HomeCoordinator
  private let service: PersonsService
  private var fetchToken: AnyCancellable?

  private func fetchPersons() {
    cleanState()
    fetchToken = service.fetchPersons(limit: 200)
      .sink { [weak self] completion in
        self?.fetchToken = nil
        switch completion {
        case .failure(let error): self?.error = error
        case .finished: print("Persons fetched succesfully")
        }
      } receiveValue: { [weak self] persons in
        self?.persons = persons
      }
  }

  private func cleanState() {
    if let token = fetchToken { token.cancel() }
    error = nil
  }
}
