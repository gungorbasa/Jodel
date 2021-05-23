//
//  AppDelegate.swift
//  JodelChallenge
//
//  Created by Michal Ciurus on 21/09/2017.
//  Copyright © 2017 Jodel. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  private lazy var startupProcesses: [StartupProcess] = [
    FlickrStartupProcess(),
    RootViewStartupProcess(window: window)
  ]

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    return startupProcesses.reduce(true) {
      $0 && $1.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
  }
}

