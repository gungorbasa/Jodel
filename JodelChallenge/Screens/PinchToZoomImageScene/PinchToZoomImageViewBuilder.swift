//
//  PinchToZoomImageViewBuilder.swift
//  JodelChallenge
//
//  Created Gungor Basa on 5/22/21.
//  Copyright © 2021 Jodel. All rights reserved.
//

import UIKit

final class PinchToZoomImageViewBuilder {
  
  static func make(with url: URL) -> PinchToZoomImageViewViewController {
    let view = PinchToZoomImageViewViewController()
    // TODO: Injections
    let router = PinchToZoomImageViewRouter(view)
    let interactor = PinchToZoomImageViewInteractor(with: url)
    let presenter = PinchToZoomImageViewPresenter(view, interactor: interactor, router: router)
    view.presenter = presenter
    return view
  }
}
