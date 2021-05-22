//
//  PhotoFeedViewMock.swift
//  JodelChallengeTests
//
//  Created by Gungor Basa on 5/23/21.
//  Copyright © 2021 Jodel. All rights reserved.
//

import Foundation
@testable import JodelChallenge

final class PhotoFeedViewMock: PhotoFeedViewProtocol {
  var output: PhotoFeedPresenterOutput = .reload

  func handleOutput(_ output: PhotoFeedPresenterOutput) {
    self.output = output
  }
}
