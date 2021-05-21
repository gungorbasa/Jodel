//
//  RootViewStartupProcess.swift
//  JodelChallenge
//
//  Created by Gungor Basa on 5/21/21.
//  Copyright © 2021 Jodel. All rights reserved.
//

import UIKit

final class RootViewStartupProcess: StartupProcess {
  private var window: UIWindow?

  init(window: UIWindow?) {
    self.window = window
  }

  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?
  ) -> Bool {
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.makeKeyAndVisible()
    window?.rootViewController = PhotoFeedBuilder.make()
    return true
  }
}
