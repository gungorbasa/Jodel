//
//  PinchToZoomImageViewContracts.swift
//  JodelChallenge
//
//  Created Gungor Basa on 5/22/21.
//  Copyright © 2021 Jodel. All rights reserved.
//

import Foundation

// MARK: - Interactor
protocol PinchToZoomImageViewInteractorProtocol: AnyObject {

    var delegate: PinchToZoomImageViewInteractorDelegate? { get set }
}

enum PinchToZoomImageViewInteractorOutput {

}

protocol PinchToZoomImageViewInteractorDelegate: AnyObject {

    func handleOutput(_ output: PinchToZoomImageViewInteractorOutput)
}

// MARK: - Presenter
protocol PinchToZoomImageViewPresenterProtocol: AnyObject {
  func onViewDidLoad()
  func onTapClose()
}

enum PinchToZoomImageViewPresenterOutput: Equatable {
  case loadImage(url: URL)
}

// MARK: - View
protocol PinchToZoomImageViewViewProtocol: AnyObject {

    func handleOutput(_ output: PinchToZoomImageViewPresenterOutput)
}

// MARK: - Router
enum PinchToZoomImageViewRoute: Equatable {
  case close
}

protocol PinchToZoomImageViewRouterProtocol: AnyObject {

    func navigate(to route: PinchToZoomImageViewRoute)
}
