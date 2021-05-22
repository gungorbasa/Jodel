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
  private var dataSource = [PhotoFeedCellViewModel]()
  
  init(_ view: PhotoFeedViewProtocol, interactor: PhotoFeedInteractorProtocol, router: PhotoFeedRouterProtocol) {
    self.view = view
    self.interactor = interactor
    self.router = router
    self.interactor.delegate = self
  }

  func onViewDidLoad() {
    interactor.fetchImageURLS()
  }

  func itemSelected(at index: Int) {
    // TODO: Implement routing to full size image viewer
    print("Selected Index: \(index)")
    guard dataSource.count > index else {
      return
    }
    let viewModel = dataSource[index]
    print(viewModel)
  }

  func numberOfItems() -> Int {
    dataSource.count
  }

  func viewModelForIndex(index: Int) -> PhotoFeedCellViewModel? {
    guard index < dataSource.count else {
      return nil
    }
    return dataSource[index]
  }
}

extension PhotoFeedPresenter: PhotoFeedInteractorDelegate {
  
  func handleOutput(_ output: PhotoFeedInteractorOutput) {
    switch output {
    case .photos(let photos):
      let viewModels = photos.map { PhotoFeedCellViewModel(url: $0.url, title: $0.title) }
      DispatchQueue.main.async {
        self.dataSource = viewModels
        self.view?.handleOutput(.reload)
      }
    case .error:
      DispatchQueue.main.async {
        self.router.navigate(to: .alert(message: "Something went wrong. Please, try again!"))
      }
    }
  }
}
