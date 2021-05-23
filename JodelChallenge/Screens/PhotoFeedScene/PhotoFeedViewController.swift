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
  private let layout = UICollectionViewFlowLayout()
  private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)

  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
    presenter?.onViewDidLoad()
  }
}

private extension PhotoFeedViewController {
  func setup() {
    view.backgroundColor = .groupTableViewBackground
    setupCollectionView()
    setupRefreshControl()
  }

  func setupCollectionView() {
    view.addSubview(collectionView)
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.backgroundColor = .groupTableViewBackground

    layout.scrollDirection = .vertical
    layout.minimumInteritemSpacing = 0
    layout.minimumLineSpacing = 0
    collectionView.isPagingEnabled = true

    collectionView.register(cell: PhotoFeedCell.self)

    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.snp.makeConstraints {
      $0.edges.equalTo(view.layoutMarginsGuide)
    }
  }

  func setupRefreshControl() {
    let refreshControl = UIRefreshControl()
    refreshControl.addTarget(self, action: #selector(onPullRefresh), for: .valueChanged)
    collectionView.refreshControl = refreshControl
    collectionView.alwaysBounceVertical = true
  }

  @objc
  func onPullRefresh() {
    presenter?.onRefreshData()
  }
}

extension PhotoFeedViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    presenter?.numberOfItems() ?? 0
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(PhotoFeedCell.self, for: indexPath)
    if let viewModel = presenter?.viewModelForIndex(index: indexPath.row) {
      cell.configure(with: viewModel)
    }
    return cell
  }
}

extension PhotoFeedViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    presenter?.itemSelected(at: indexPath.row)
  }

  func collectionView(
    _ collectionView: UICollectionView,
    willDisplay cell: UICollectionViewCell,
    forItemAt indexPath: IndexPath
  ) {
    presenter?.willDisplayCell(at: indexPath.row)
  }
}

extension PhotoFeedViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    sizeForItemAt indexPath: IndexPath
  ) -> CGSize {
    let cvRect = collectionView.frame
    return CGSize(
      width: cvRect.width,
      height: cvRect.height
    )
  }
}

extension PhotoFeedViewController: PhotoFeedViewProtocol {

  func handleOutput(_ output: PhotoFeedPresenterOutput) {
    switch output {
    case .reload:
      collectionView.reloadData()
    case .insertItems(let indexPaths):
      collectionView.insertItems(at: indexPaths)
    case .startRefreshing:
      collectionView.refreshControl?.beginRefreshing()
    case .endRefreshing:
      collectionView.refreshControl?.endRefreshing()
    }
  }
}
