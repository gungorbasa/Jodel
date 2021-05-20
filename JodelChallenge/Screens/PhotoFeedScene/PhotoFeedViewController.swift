//
//  PhotoFeedViewController.swift
//  JodelChallenge
//
//  Created Gungor Basa on 5/21/21.
//  Copyright © 2021 Jodel. All rights reserved.
//

import UIKit

final class PhotoFeedViewController: UIViewController {

    var presenter: PhotoFeedPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {

    }
}

extension PhotoFeedViewController: PhotoFeedViewProtocol {

    func handleOutput(_ output: PhotoFeedPresenterOutput) {

    }
}
