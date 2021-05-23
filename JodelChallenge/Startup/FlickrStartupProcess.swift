//
//  FlickrConfiguration.swift
//  JodelChallenge
//
//  Created by Gungor Basa on 5/21/21.
//  Copyright © 2021 Jodel. All rights reserved.
//

import FlickrKit
import UIKit

struct FlickrStartupProcess: StartupProcess {
  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?
  ) -> Bool {
    // TODO: Get these values from config
    FlickrKit.shared().initialize(
      withAPIKey: "92111faaf0ac50706da05a1df2e85d82",
      sharedSecret: "89ded1035d7ceb3a"
    )
    return true
  }
}
