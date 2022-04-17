//
//  NewsfeedModels.swift
//  VkNewsFeed
//
//  Created by Nikita Kryuchkov on 23.03.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum Newsfeed {
   
  enum Model {
    struct Request {
      enum RequestType {
        case getNewsFeed
      }
    }
    struct Response {
      enum ResponseType {
          case presentNewsfeed(feed: FeedResponse)
      }
    }
    struct ViewModel {
      enum ViewModelData {
          case displayNewsfeed(feedViewModal: FeedViewModal)
      }
    }
  }
}

struct FeedViewModal {
    struct Cell: FeedCellViewModel {
        var iconUrlString: String
        var name: String
        var date: String
        var text: String?
        var likes: String?
        var comments: String?
        var shares: String?
        var views: String?
        var photoAttachment: FeedCeelPhotoAttachmentViewModal?
        var sizes: FeedCellSizes
    }
    
    struct FeedCellPhotoAttachment: FeedCeelPhotoAttachmentViewModal {
        var photoUrlString: String?
        var width: Int
        var height: Int        
    }
    
    let cells: [Cell]
}
