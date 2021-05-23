//
//  PhotoFeedInteractorTests.swift
//  JodelChallengeTests
//
//  Created by Gungor Basa on 5/23/21.
//  Copyright © 2021 Jodel. All rights reserved.
//

import XCTest
@testable import JodelChallenge

class PhotoFeedInteractorTests: XCTestCase {
  func testFetchImageURLS() throws {
    let service = PhotoFeedServiceMock()
    let interactor = PhotoFeedInteractor(service: service)

    interactor.fetchImageURLS()
    XCTAssertTrue(service.isFetchCalled, "fetchImageURLS should call service.fetch")
  }

  func testFetchMoreImageURLS() throws {
    let service = PhotoFeedServiceMock()
    let interactor = PhotoFeedInteractor(service: service)

    interactor.fetchMoreImageURLS()
    XCTAssertTrue(service.isFetchMoreCalled, "fetchMoreImageURLS should call service.fetchMore")
  }
}
