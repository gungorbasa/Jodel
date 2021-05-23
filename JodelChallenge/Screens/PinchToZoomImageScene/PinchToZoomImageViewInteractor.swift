//
//  PinchToZoomImageViewInteractor.swift
//  JodelChallenge
//
//  Created Gungor Basa on 5/22/21.
//  Copyright © 2021 Jodel. All rights reserved.
//

import Foundation

final class PinchToZoomImageViewInteractor: PinchToZoomImageViewInteractorProtocol {

  weak var delegate: PinchToZoomImageViewInteractorDelegate?
  private let url: URL

  init(with url: URL) {
    self.url = url
  }

  func setImage() {
    delegate?.handleOutput(.imageURL(url))
  }
}

