//
//  NewsfeedPresenter.swift
//  VkNewsFeed
//
//  Created by Nikita Kryuchkov on 23.03.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol NewsfeedPresentationLogic {
  func presentData(response: Newsfeed.Model.Response.ResponseType)
}

class NewsfeedPresenter: NewsfeedPresentationLogic {
  weak var viewController: NewsfeedDisplayLogic?
  
  func presentData(response: Newsfeed.Model.Response.ResponseType) {
  
      switch response {
          
      case let .presentNewsfeed(feed):
          let cells = feed.items.map { cellViewModal(from: $0)}
          let feedViewModal = FeedViewModal(cells: cells)
          
          viewController?.displayData(viewModel: .displayNewsfeed(feedViewModal: feedViewModal))
      }
  }
  
    private func cellViewModal(from feedItem: FeedItem) -> FeedViewModal.Cell {
        return FeedViewModal.Cell.init(
            iconUrlString: "",
            name: "future name",
            date: "future date",
            text: feedItem.text,
            likes: String(feedItem.likes?.count ?? 0),
            comments: String(feedItem.comments?.count ?? 0),
            shares: String(feedItem.reports?.count ?? 0),
            views: String(feedItem.views?.count ?? 0)
        )
    }
}
