//
//  PhotoFeedRouter.swift
//  JodelChallenge
//
//  Created Gungor Basa on 5/21/21.
//  Copyright © 2021 Jodel. All rights reserved.
//

import UIKit

final class PhotoFeedRouter: PhotoFeedRouterProtocol {

  weak var view: UIViewController?

  init(_ view: UIViewController) {
    self.view = view
  }

  func navigate(to route: PhotoFeedRoute) {
    switch route {
    case .alert(let message):
      present(message: message)
    case .pinchToZoomImageView(let url):
      let viewController = PinchToZoomImageViewBuilder.make()
      view?.present(viewController, animated: true)
    }
  }
}

private extension PhotoFeedRouter {
  func present(message: String) {
    let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
    view?.present(alert, animated: true)
  }
}
