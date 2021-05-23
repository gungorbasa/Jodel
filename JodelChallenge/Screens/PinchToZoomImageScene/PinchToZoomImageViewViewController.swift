//
//  PinchToZoomImageViewViewController.swift
//  JodelChallenge
//
//  Created Gungor Basa on 5/22/21.
//  Copyright © 2021 Jodel. All rights reserved.
//

import Nuke
import UIKit

final class PinchToZoomImageViewViewController: UIViewController {

  var presenter: PinchToZoomImageViewPresenterProtocol?

  private let scrollView = UIScrollView()
  private let imageView = UIImageView()
  private let closeButton = UIButton()

  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
    presenter?.onViewDidLoad()
  }
}

private extension PinchToZoomImageViewViewController {
  func setup() {
    view.backgroundColor = .black
    setupScrollView()
    setupImageView()
    setupCloseButton()
  }

  func setupScrollView() {
    view.addSubview(scrollView)
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    scrollView.delegate = self
    scrollView.maximumZoomScale = 6.0
    scrollView.snp.makeConstraints { $0.edges.equalTo(view.layoutMargins) }
  }

  func setupImageView() {
    scrollView.addSubview(imageView)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.contentMode = .scaleAspectFit
    imageView.snp.makeConstraints {
      $0.centerY.centerX.equalToSuperview()
      $0.width.height.equalToSuperview()
    }
  }

  func setupCloseButton() {
    view.addSubview(closeButton)
    closeButton.setImage(
      UIImage(named: "close_button")?
        .withRenderingMode(.alwaysTemplate),
      for: .normal
    )
    closeButton.imageEdgeInsets = UIEdgeInsets(top: 11, left: 11, bottom: 11, right: 11)
    closeButton.translatesAutoresizingMaskIntoConstraints = false
    closeButton.tintColor = .white
    closeButton.addTarget(self, action: #selector(onTapCloseButton), for: .touchUpInside)
    closeButton.snp.makeConstraints {
      $0.left.top.equalTo(view.layoutMargins).inset(16)
      $0.size.equalTo(44)
    }
  }

  @objc
  func onTapCloseButton() {
    presenter?.onTapClose()
  }
}

extension PinchToZoomImageViewViewController: UIScrollViewDelegate {
  func viewForZooming(in scrollView: UIScrollView) -> UIView? { imageView }
}

extension PinchToZoomImageViewViewController: PinchToZoomImageViewViewProtocol {
  func handleOutput(_ output: PinchToZoomImageViewPresenterOutput) {
    switch output {
    case .loadImage(let url):
      Nuke.loadImage(with: url, into: imageView)
    case .setImage(let name):
      imageView.image = UIImage(named: name)
    }
  }
}
