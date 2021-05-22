//
//  PhotoListSevice.swift
//  JodelChallenge
//
//  Created by Gungor Basa on 5/21/21.
//  Copyright © 2021 Jodel. All rights reserved.
//

import Foundation

protocol PhotoFeedServing {
  func fetch(completion: @escaping (Result<[Photo], Error>) -> Void)
}

final class PhotoFeedService: PhotoFeedServing {
  private let flickrApi: FlickrAPI

  init(api: FlickrAPI = Flickr()) {
    self.flickrApi = api
  }

  func fetch(completion: @escaping (Result<[Photo], Error>) -> Void) {
    flickrApi.fetchInterestingnessList { result in
      switch result {
      case .success(let photos):
        completion(.success(photos))
      case .failure(let error):
        completion(.failure(error))
      }
    }
  }
}
