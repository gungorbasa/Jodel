//
//  ThreadSafeBox.swift
//  JodelChallenge
//
//  Created by Gungor Basa on 5/23/21.
//  Copyright © 2021 Jodel. All rights reserved.
//

import Foundation

struct ThreadSafeBox<T> {
  private var _value: T

  /// Thread safe value, uses the main thread to synchronize the accesses
  var value: T {
    get {
      if Thread.isMainThread { return _value }
      else { return DispatchQueue.main.sync { _value } }
    }
    set {
      if Thread.isMainThread { _value = newValue }
      else { DispatchQueue.main.sync { _value = newValue } }
    }
  }

  /// Initializes the box with the given value
  init(_ value: T) {
    _value = value
  }
}
