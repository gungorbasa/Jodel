//
//  PhotoFeedRouter.swift
//  JodelChallenge
//
//  Created Gungor Basa on 5/21/21.
//  Copyright © 2021 Jodel. All rights reserved.
//

import UIKit

final class PhotoFeedRouter: PhotoFeedRouterProtocol {

    unowned let view: UIViewController

    init(_ view: UIViewController) {
        self.view = view
    }

    func navigate(to route: PhotoFeedRoute) {

    }
}
