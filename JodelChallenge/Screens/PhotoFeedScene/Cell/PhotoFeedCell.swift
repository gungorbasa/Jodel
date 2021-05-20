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
    Nuke.loadImage(with: viewModel.url, into: imageView)
    titleLabel.text = viewModel.title
  }
}

private extension PhotoFeedCell {
  func setup() {
    setupImageView()
    setupTitleLabel()
  }

  func setupImageView() {
    contentView.addSubview(imageView)
    contentView.translatesAutoresizingMaskIntoConstraints = false
    imageView.snp.makeConstraints { $0.edges.equalToSuperview() }
  }

  func setupTitleLabel() {
    contentView.addSubview(titleLabel)
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.textColor = .white
    titleLabel.snp.makeConstraints {
      $0.edges.leading.trailing.bottom.equalTo(imageView)
    }
  }
}
