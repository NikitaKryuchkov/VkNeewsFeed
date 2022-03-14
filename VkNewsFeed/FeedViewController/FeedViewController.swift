//
//  FeedViewController.swift
//  VkNewsFeed
//
//  Created by Nikita Kryuchkov on 13.03.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    private let networkService = NetworkService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBlue
        networkService.getFeed()
    }
}
