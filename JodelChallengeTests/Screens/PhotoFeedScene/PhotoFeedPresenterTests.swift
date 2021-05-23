//
//  PhotoFeedPresenterTests.swift
//  JodelChallengeTests
//
//  Created by Gungor Basa on 5/23/21.
//  Copyright © 2021 Jodel. All rights reserved.
//

import XCTest
@testable import JodelChallenge

class PhotoFeedPresenterTests: XCTestCase {
  private var service: PhotoFeedServiceMock!
  private var interactor: PhotoFeedInteractorMock!
  private var view: PhotoFeedViewMock!
  private var router: PhotoFeedRouterMock!
  private var presenter: PhotoFeedPresenter!

  private let photos = [
    Photo(title: "1", url: URL(string: "https://www.google.com")),
    Photo(title: "2", url: nil),
    Photo(title: "3", url: nil)
  ]

  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
    service = PhotoFeedServiceMock()
    interactor = PhotoFeedInteractorMock()
    view = PhotoFeedViewMock()
    router = PhotoFeedRouterMock()
    presenter = PhotoFeedPresenter(view, interactor: interactor, router: router)
  }

  func testOnViewDidLoad() {
    interactor.isFetchImages = false
    view.output = .endRefreshing
    presenter.onViewDidLoad()
    XCTAssertTrue(interactor.isFetchImages, "Should call fetchImages")
    XCTAssert(view.output == .startRefreshing, "Should call start refreshing")
  }

  func testWillDisplayCellCallFetchMore() {
    interactor.isFetchMoreImages = false
    presenter.handleOutput(.photos(photos))
    let expectation = expectation(description: "testWillDisplayCellCallFetchMore")
    // Should wait for next Main queue
    DispatchQueue.main.async {
      expectation.fulfill()
    }
    waitForExpectations(timeout: 1, handler: nil)
    presenter.willDisplayCell(at: 1)
    XCTAssertTrue(interactor.isFetchMoreImages, "WillDisplayCell with index 1 should call fetchMore")
  }

  func testWillDisplayCellNoCallFetchMore() {
    interactor.isFetchMoreImages = false
    presenter.handleOutput(.photos(photos))
    let expectation = expectation(description: "testWillDisplayCellCallFetchMore")
    // Should wait for next Main queue
    DispatchQueue.main.async {
      expectation.fulfill()
    }
    waitForExpectations(timeout: 1, handler: nil)
    presenter.willDisplayCell(at: 0)
    XCTAssertFalse(interactor.isFetchMoreImages, "WillDisplayCell with index 1 should not call fetchMore")
  }

  func testItemSelectedAtIndexRouteToCorrectURL() {
    presenter.handleOutput(.photos(photos))
    let expectation = expectation(description: "testWillDisplayCellCallFetchMore")
    // Should wait for next Main queue
    DispatchQueue.main.async {
      expectation.fulfill()
    }
    waitForExpectations(timeout: 1, handler: nil)

    presenter.itemSelected(at: 0)
    guard let url = URL(string: "https://www.google.com") else {
      XCTFail()
      return
    }
    XCTAssert(router.route == .pinchToZoomImageView(url: url), "Should route to correct URL")
  }

  func testItemSelectedAtIndexNoRouting() {
    presenter.handleOutput(.photos(photos))
    let route: PhotoFeedRoute = .alert(message: "")
    router.route = route
    let expectation = expectation(description: "testWillDisplayCellCallFetchMore")
    // Should wait for next Main queue
    DispatchQueue.main.async {
      expectation.fulfill()
    }
    waitForExpectations(timeout: 1, handler: nil)

    presenter.itemSelected(at: 1)

    XCTAssert(router.route == route, "Shouldn't route for nil url")
  }

  func testOnRefreshData() {
    interactor.isFetchImages = false
    view.output = .endRefreshing
    presenter.onRefreshData()
    XCTAssertTrue(interactor.isFetchImages, "Should call fetchImages")
    XCTAssert(view.output == .startRefreshing, "Should call start refreshing")
  }
}
