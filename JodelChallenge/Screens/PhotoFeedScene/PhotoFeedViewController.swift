//
//  PhotoFeedViewController.swift
//  JodelChallenge
//
//  Created Gungor Basa on 5/21/21.
//  Copyright © 2021 Jodel. All rights reserved.
//

import SnapKit
import UIKit

final class PhotoFeedViewController: UIViewController {

  var presenter: PhotoFeedPresenterProtocol?
  private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())

  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
  }
}

private extension PhotoFeedViewController {
  func setup() {
    view.backgroundColor = .white
    setupCollectionView()
  }

  func setupCollectionView() {
    view.addSubview(collectionView)
    collectionView.backgroundColor = .white
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.snp.makeConstraints {
      $0.edges.equalTo(view.layoutMarginsGuide)
    }
  }
}

extension PhotoFeedViewController: PhotoFeedViewProtocol {

  func handleOutput(_ output: PhotoFeedPresenterOutput) {

  }
}
