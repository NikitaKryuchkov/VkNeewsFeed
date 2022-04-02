//
//  NewsfeedInteractor.swift
//  VkNewsFeed
//
//  Created by Nikita Kryuchkov on 23.03.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol NewsfeedBusinessLogic {
  func makeRequest(request: Newsfeed.Model.Request.RequestType)
}

class NewsfeedInteractor: NewsfeedBusinessLogic {

  var presenter: NewsfeedPresentationLogic?
  var service: NewsfeedService?
    
    private var fetcher: DataFetcher = NetworkDataFetcher(networking: NetworkService())
  
  func makeRequest(request: Newsfeed.Model.Request.RequestType) {
    if service == nil {
      service = NewsfeedService()
    }
      switch request {
          
      case .getNewsFeed:
          fetcher.getFeed { [weak self] (feedResponse) in
              
              guard let feedResponse = feedResponse else { return }
              
              self?.presenter?.presentData(response: .presentNewsfeed(feed: feedResponse))
          }
          
         
      }
      
  }
  
}
