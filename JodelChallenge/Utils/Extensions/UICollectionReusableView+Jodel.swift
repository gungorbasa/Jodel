//
//  UICollectionReusableView+Jodel.swift
//  JodelChallenge
//
//  Created by Gungor Basa on 5/22/21.
//  Copyright © 2021 Jodel. All rights reserved.
//

import UIKit

extension UICollectionReusableView {
  /// Returns cell's reuse identifier
  static var identifier: String {
    return String(describing: self)
  }
}
