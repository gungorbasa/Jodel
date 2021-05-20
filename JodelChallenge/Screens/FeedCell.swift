//
//  FeedCell.swift
//  JodelChallenge
//
//  Created by Dmitry on 27/06/2019.
//  Copyright © 2019 Jodel. All rights reserved.
//

import Nuke
import UIKit

final class FeedCell : UICollectionViewCell {
  @IBOutlet private weak var imageView: UIImageView!

  public func configure(with imageUrl : URL) {
    Nuke.cancelRequest(for: imageView)
    Nuke.loadImage(with: imageUrl, into: imageView)
  }
}
