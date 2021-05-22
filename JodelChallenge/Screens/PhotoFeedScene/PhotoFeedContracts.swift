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
}

enum PhotoFeedInteractorOutput {
  case error(Error)
  case photos([Photo])
}

protocol PhotoFeedInteractorDelegate: AnyObject {

  func handleOutput(_ output: PhotoFeedInteractorOutput)
}

// MARK: - Presenter
protocol PhotoFeedPresenterProtocol: AnyObject {
  func onViewDidLoad()
  func itemSelected(at index: Int)
  func numberOfItems() -> Int
  func viewModelForIndex(index: Int) -> PhotoFeedCellViewModel?
}

enum PhotoFeedPresenterOutput: Equatable {
  case reload
}

// MARK: - View
protocol PhotoFeedViewProtocol: AnyObject {

  func handleOutput(_ output: PhotoFeedPresenterOutput)
}

// MARK: - Router
enum PhotoFeedRoute: Equatable {
  case alert(message: String)
}

protocol PhotoFeedRouterProtocol: AnyObject {

  func navigate(to route: PhotoFeedRoute)
}
