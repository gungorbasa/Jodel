//
//  UICollectionView+Jodel.swift
//  JodelChallenge
//
//  Created by Gungor Basa on 5/22/21.
//  Copyright © 2021 Jodel. All rights reserved.
//

import UIKit

extension UICollectionView {
  var fullyVisibleCells: [UICollectionViewCell] {
    visibleCells.filter { cell in
      let cellRect = convert(cell.frame, to: superview)
      return frame.contains(cellRect)
    }
  }

  /// Register cell for given `cell` class
  func register<T: UICollectionViewCell>(cell: T.Type) {
    register(cell, forCellWithReuseIdentifier: T.identifier)
  }

  /// Register header for given `view` class
  func register<T: UICollectionReusableView>(headerView: T.Type) {
    register(headerView, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: T.identifier)
  }

  /// Register footer for given `view` class
  func register<T: UICollectionReusableView>(footerView: T.Type) {
    register(footerView, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: T.identifier)
  }

  /// Dequeue reusable cell
  func dequeueReusableCell<T: UICollectionViewCell>(_ cell: T.Type, for indexPath: IndexPath) -> T {
    guard let cell = dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as? T else {
      return T()
    }
    return cell
  }

  /// Dequeue reusable header view
  func dequeueReusableHeaderView<T: UICollectionReusableView>(_ view: T.Type, for indexPath: IndexPath) -> T {
    guard let view = dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: T.identifier, for: indexPath) as? T else {
      return T()
    }
    return view
  }

  /// Dequeue reusable footer view
  func dequeueReusableFooterView<T: UICollectionReusableView>(_ view: T.Type, for indexPath: IndexPath) -> T {
    guard let view = dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: T.identifier, for: indexPath) as? T else {
      return T()
    }
    return view
  }

  /// Initializes vertical collectionView with optional `layout` param
  static func vertical(layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()) -> UICollectionView {
    layout.scrollDirection = .vertical
    let instance = UICollectionView(frame: .zero, collectionViewLayout: layout)
    return instance
  }

  /// Initializes horizontal collectionView with optional `layout` param
  static func horizontal(layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()) -> UICollectionView {
    layout.scrollDirection = .horizontal
    let instance = UICollectionView(frame: .zero, collectionViewLayout: layout)
    return instance
  }
}
