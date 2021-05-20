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

  private let service: PhotoFeedServing

  init(service: PhotoFeedService) {
    self.service = service
  }

  func fetchImageURLS() {
    service.fetch { [weak self] result in
      switch result {
      case .success(let urls):
        self?.delegate?.handleOutput(.urls(urls))
      case .failure(let error):
        self?.delegate?.handleOutput(.error(error))
      }
    }
  }
}
