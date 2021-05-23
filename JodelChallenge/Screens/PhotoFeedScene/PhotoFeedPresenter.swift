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
    view?.handleOutput(.startRefreshing)
  }

  func onRefreshData() {
    interactor.fetchImageURLS()
    view?.handleOutput(.startRefreshing)
  }

  func willDisplayCell(at index: Int) {
    if index == dataSource.count - 2 {
      interactor.fetchMoreImageURLS()
    }
  }

  func itemSelected(at index: Int) {
    guard dataSource.count > index, let url = dataSource[index].url else {
      return
    }
    router.navigate(to: .pinchToZoomImageView(url: url))
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
        self.view?.handleOutput(.endRefreshing)
      }
    case .morePhotos(let photos):
      let viewModels = photos.map { PhotoFeedCellViewModel(url: $0.url, title: $0.title) }
      DispatchQueue.main.async {
        let beforeSize = self.dataSource.count
        self.dataSource.append(contentsOf: viewModels)
        let afterSize = self.dataSource.count
        let indexPaths = (beforeSize ..< afterSize).map { IndexPath(item: $0, section: 0) }
        self.view?.handleOutput(.insertItems(at: indexPaths))
        self.view?.handleOutput(.endRefreshing)
      }
    case .error:
      DispatchQueue.main.async {
        self.view?.handleOutput(.endRefreshing)
        self.router.navigate(to: .alert(message: "Something went wrong. Please, try again!"))
      }
    }
  }
}
