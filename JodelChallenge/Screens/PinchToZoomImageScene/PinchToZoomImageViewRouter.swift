//
//  PinchToZoomImageViewRouter.swift
//  JodelChallenge
//
//  Created Gungor Basa on 5/22/21.
//  Copyright © 2021 Jodel. All rights reserved.
//

import UIKit

final class PinchToZoomImageViewRouter: PinchToZoomImageViewRouterProtocol {
    weak var view: UIViewController?

    init(_ view: UIViewController) {
        self.view = view
    }

    func navigate(to route: PinchToZoomImageViewRoute) {
      view?.dismiss(animated: true, completion: nil)
    }
}
