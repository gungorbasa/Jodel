//
//  PhotoListSevice.swift
//  JodelChallenge
//
//  Created by Gungor Basa on 5/21/21.
//  Copyright © 2021 Jodel. All rights reserved.
//

import Foundation

protocol PhotoListServing {
  func fetch(completion: @escaping (Result<[URL], Error>) -> Void)
}

final class PhotoListService: PhotoListServing {
  func fetch(completion: @escaping (Result<[URL], Error>) -> Void) {
    FlickrApi.fetchPhotos { urls, error in
      if let error = error {
        completion(.failure(error))
      } else {
        completion(.success(urls ?? []))
      }
    }
  }
}
