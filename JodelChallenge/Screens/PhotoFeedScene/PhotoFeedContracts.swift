//
//  PhotoFeedContracts.swift
//  JodelChallenge
//
//  Created Gungor Basa on 5/21/21.
//  Copyright © 2021 Jodel. All rights reserved.
//

import Foundation

// MARK: - Interactor
protocol PhotoFeedInteractorProtocol: AnyObject {

  var delegate: PhotoFeedInteractorDelegate? { get set }

  func fetchImageURLS()
  func fetchMoreImageURLS()
}

enum PhotoFeedInteractorOutput {
  case error(Error)
  case photos([Photo])
  case morePhotos([Photo])
}

protocol PhotoFeedInteractorDelegate: AnyObject {

  func handleOutput(_ output: PhotoFeedInteractorOutput)
}

// MARK: - Presenter
protocol PhotoFeedPresenterProtocol: AnyObject {
  func onViewDidLoad()
  func onRefreshData()
  func willDisplayCell(at index: Int)
  func itemSelected(at index: Int)
  func numberOfItems() -> Int
  func viewModelForIndex(index: Int) -> PhotoFeedCellViewModel?
}

enum PhotoFeedPresenterOutput: Equatable {
  case reload
  case insertItems(at: [IndexPath])
  case startRefreshing
  case endRefreshing
}

// MARK: - View
protocol PhotoFeedViewProtocol: AnyObject {

  func handleOutput(_ output: PhotoFeedPresenterOutput)
}

// MARK: - Router
enum PhotoFeedRoute: Equatable {
  case alert(message: String)
  case pinchToZoomImageView(url: URL)
}

protocol PhotoFeedRouterProtocol: AnyObject {

  func navigate(to route: PhotoFeedRoute)
}
