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
  func fetchMore(completion: @escaping (Result<[Photo], Error>) -> Void)
}

final class PhotoFeedService: PhotoFeedServing {
  private let flickrApi: FlickrAPI
  // This structure of paging may lead to show third page before second page
  // But in our case its fine
  private var page: Int = 1

  init(api: FlickrAPI = Flickr()) {
    self.flickrApi = api
  }

  func fetch(completion: @escaping (Result<[Photo], Error>) -> Void) {
    page = 1
    flickrApi.fetchInterestingnessList(page: page, completion: completion)
  }

  func fetchMore(completion: @escaping (Result<[Photo], Error>) -> Void) {
    page += 1
    flickrApi.fetchInterestingnessList(page: page, completion: completion)
  }
}
