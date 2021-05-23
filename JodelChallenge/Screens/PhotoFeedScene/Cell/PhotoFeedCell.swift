//
//  PhotoFeedCell.swift
//  JodelChallenge
//
//  Created by Gungor Basa on 5/21/21.
//  Copyright © 2021 Jodel. All rights reserved.
//

import Nuke
import UIKit

final class PhotoFeedCell: UICollectionViewCell {
  private let imageView = UIImageView()
  private let titleLabel = UILabel()

  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func configure(with viewModel: PhotoFeedCellViewModel) {
    Nuke.cancelRequest(for: imageView)
    if let url = viewModel.url {
      Nuke.loadImage(with: url, into: imageView)
    }
    titleLabel.text = viewModel.title
  }
}

private extension PhotoFeedCell {
  func setup() {
    backgroundColor = .groupTableViewBackground
    setupImageView()
    setupTitleLabel()
  }

  func setupImageView() {
    contentView.addSubview(imageView)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.snp.makeConstraints { $0.edges.equalToSuperview() }
    imageView.contentMode = .scaleAspectFit
    imageView.backgroundColor = .groupTableViewBackground
  }

  func setupTitleLabel() {
    contentView.addSubview(titleLabel)
    titleLabel.numberOfLines = 0
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.textColor = .white
    titleLabel.backgroundColor = UIColor.black.withAlphaComponent(0.3)
    titleLabel.snp.makeConstraints {
      $0.leading.trailing.bottom.equalTo(imageView)
    }
  }
}
