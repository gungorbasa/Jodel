//
//  PhotoFeedInteractor.swift
//  JodelChallenge
//
//  Created Gungor Basa on 5/21/21.
//  Copyright © 2021 Jodel. All rights reserved.
//

import Foundation

final class PhotoFeedInteractor: PhotoFeedInteractorProtocol {

  weak var delegate: PhotoFeedInteractorDelegate?
  private var isFetching: ThreadSafeBox<Bool> = .init(false)

  private let service: PhotoFeedServing

  init(service: PhotoFeedServing) {
    self.service = service
  }

  func fetchImageURLS() {
    isFetching.value = true
    service.fetch { [weak self] result in
      self?.isFetching.value = false
      switch result {
      case .success(let photos):
        self?.delegate?.handleOutput(.photos(photos))
      case .failure(let error):
        self?.delegate?.handleOutput(.error(error))
      }
    }
  }

  func fetchMoreImageURLS() {
    guard isFetching.value == false else { return }
    isFetching.value = true
    service.fetchMore { [weak self] result in
      self?.isFetching.value = false
      switch result {
      case .success(let photos):
        self?.delegate?.handleOutput(.morePhotos(photos))
      case .failure(let error):
        self?.delegate?.handleOutput(.error(error))
      }
    }
  }
}
