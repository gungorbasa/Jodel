//
//  Flickr.swift
//  JodelChallenge
//
//  Created by Gungor Basa on 5/21/21.
//  Copyright © 2021 Jodel. All rights reserved.
//

import FlickrKit
import Foundation

enum FlickrAPIError: Error {
  case unknown
}

protocol FlickrAPI {
  func fetchInterestingnessList(page: Int, completion: @escaping (Result<[Photo], Error>) -> Void)
}

final class Flickr: FlickrAPI {
  static let shared = Flickr()

  func fetchInterestingnessList(page: Int, completion: @escaping (Result<[Photo], Error>) -> Void) {
    let flickrInteresting = FKFlickrInterestingnessGetList()
    flickrInteresting.per_page = "10"
    // TODO: Might wanna implement pagination in the future
    flickrInteresting.page = "\(page)"

    FlickrKit.shared().call(flickrInteresting) { responseDictionary, error in
      if let error = error {
        completion(.failure(error))
      } else if let photos = FlickrKit.shared().photoArray(fromResponse: responseDictionary ?? [:]) {
        let photoModels = photos.map {
          Photo(
            title: ($0["title"] as? String) ?? "",
            url: FlickrKit.shared().photoURL(for: .large1024, fromPhotoDictionary: $0)
          )
        }
        completion(.success(photoModels))
      } else {
        completion(.failure(FlickrAPIError.unknown))
      }
    }
  }
}
