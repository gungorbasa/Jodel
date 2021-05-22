//
//  PinchToZoomImageViewPresenter.swift
//  JodelChallenge
//
//  Created Gungor Basa on 5/22/21.
//  Copyright © 2021 Jodel. All rights reserved.
//

import Foundation

final class PinchToZoomImageViewPresenter: PinchToZoomImageViewPresenterProtocol {

  private unowned let view: PinchToZoomImageViewViewProtocol

  private let interactor: PinchToZoomImageViewInteractorProtocol
  private let router: PinchToZoomImageViewRouterProtocol

  init(_ view: PinchToZoomImageViewViewProtocol, interactor: PinchToZoomImageViewInteractorProtocol, router: PinchToZoomImageViewRouterProtocol) {
    self.view = view
    self.interactor = interactor
    self.router = router
    self.interactor.delegate = self
  }

  func onViewDidLoad() {
    
  }

  func onTapClose() {
    router.navigate(to: .close)
  }
}

extension PinchToZoomImageViewPresenter: PinchToZoomImageViewInteractorDelegate {

  func handleOutput(_ output: PinchToZoomImageViewInteractorOutput) {

  }
}
