//
//  PhotoFeedInteractorMock.swift
//  JodelChallengeTests
//
//  Created by Gungor Basa on 5/23/21.
//  Copyright © 2021 Jodel. All rights reserved.
//

import Foundation
@testable import JodelChallenge

final class PhotoFeedInteractorMock: PhotoFeedInteractorProtocol {
  var delegate: PhotoFeedInteractorDelegate?

  var isFetchImages = false
  var isFetchMoreImages = false

  func fetchImageURLS() {
    isFetchImages = true
  }

  func fetchMoreImageURLS() {
    isFetchMoreImages = true
  }
}
