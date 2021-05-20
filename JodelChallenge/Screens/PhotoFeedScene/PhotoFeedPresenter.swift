//
//  PhotoFeedPresenter.swift
//  JodelChallenge
//
//  Created Gungor Basa on 5/21/21.
//  Copyright © 2021 Jodel. All rights reserved.
//

import Foundation

final class PhotoFeedPresenter: PhotoFeedPresenterProtocol {
  
  private weak var view: PhotoFeedViewProtocol?
  
  private let interactor: PhotoFeedInteractorProtocol
  private let router: PhotoFeedRouterProtocol
  
  init(_ view: PhotoFeedViewProtocol, interactor: PhotoFeedInteractorProtocol, router: PhotoFeedRouterProtocol) {
    self.view = view
    self.interactor = interactor
    self.router = router
    self.interactor.delegate = self
  }
}

extension PhotoFeedPresenter: PhotoFeedInteractorDelegate {
  
  func handleOutput(_ output: PhotoFeedInteractorOutput) {
    DispatchQueue.main.async {
      switch output {
      case .urls(let urls):
        print(urls)
      case .error:
        self.router.navigate(to: .alert(message: "Something went wrong. Please, try again!"))
      }
    }
  }
}
