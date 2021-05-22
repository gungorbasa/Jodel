//
//  PhotoFeedServiceMock.swift
//  JodelChallengeTests
//
//  Created by Gungor Basa on 5/23/21.
//  Copyright © 2021 Jodel. All rights reserved.
//

import Foundation
@testable import JodelChallenge

final class PhotoFeedServiceMock: PhotoFeedServing {
  var isFetchCalled = false
  var isFetchMoreCalled = false
  var fetchResult: Result<[Photo], Error> = .success([])
  var fetchMoreResult: Result<[Photo], Error> = .success([])

  func fetch(completion: @escaping (Result<[Photo], Error>) -> Void) {
    isFetchCalled = true
    completion(fetchResult)
  }

  func fetchMore(completion: @escaping (Result<[Photo], Error>) -> Void) {
    isFetchMoreCalled = true
    completion(fetchMoreResult)
  }
}
