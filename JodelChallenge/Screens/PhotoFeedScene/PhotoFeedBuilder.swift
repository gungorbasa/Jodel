//
//  PhotoFeedBuilder.swift
//  JodelChallenge
//
//  Created Gungor Basa on 5/21/21.
//  Copyright © 2021 Jodel. All rights reserved.
//

import UIKit

final class PhotoFeedBuilder {

  static func make() -> PhotoFeedViewController {
    let view = PhotoFeedViewController()
    // TODO: Injections
    let router = PhotoFeedRouter(view)
    let service = PhotoFeedService()
    let interactor = PhotoFeedInteractor(service: service)
    let presenter = PhotoFeedPresenter(view, interactor: interactor, router: router)
    view.presenter = presenter
    return view
  }
}
