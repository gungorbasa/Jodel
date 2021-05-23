//
//  PhotoFeedRouterMock.swift
//  JodelChallengeTests
//
//  Created by Gungor Basa on 5/23/21.
//  Copyright © 2021 Jodel. All rights reserved.
//

import Foundation
@testable import JodelChallenge

final class PhotoFeedRouterMock: PhotoFeedRouterProtocol {
  var route: PhotoFeedRoute = .alert(message: "")

  func navigate(to route: PhotoFeedRoute) {
    self.route = route
  }
}
