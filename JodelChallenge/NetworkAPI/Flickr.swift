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
  func fetchInterestingnessList(completion: @escaping (Result<[Photo], Error>) -> Void)
}

final class Flickr: FlickrAPI {
  static let shared = Flickr()
  private var page: Int = 1

  // Paging structure might lead to show third page before second page
  // But for the current case, it doesn't really matter
  func fetchInterestingnessList(completion: @escaping (Result<[Photo], Error>) -> Void) {
    page = 1
    fetch(page: page, completion: completion)
  }

  func fetchInterestingnessListMore(completion: @escaping (Result<[Photo], Error>) -> Void) {
    page += 1
    fetch(page: page, completion: completion)
  }

  private func fetch(
    page: Int,
    completion: @escaping (Result<[Photo], Error>) -> Void
  ) {
    let request = FKFlickrInterestingnessGetList()
    request.per_page = "10"
    request.page = "\(page)"

    FlickrKit.shared().call(request) { responseDictionary, error in
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
