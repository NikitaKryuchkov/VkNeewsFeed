//
//  FeedViewController.swift
//  VkNewsFeed
//
//  Created by Nikita Kryuchkov on 13.03.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    private var fetcher: DataFetcher = NetworkDataFetcher(networking: NetworkService())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBlue
        fetcher.getFeed { (feedResponse) in
            guard let feedResponse = feedResponse else { return }
            feedResponse.items.map { feedItem in
                print(feedItem.date)
            }
        }
    }
}

