//
//  FeedRespose.swift
//  VkNewsFeed
//
//  Created by Nikita Kryuchkov on 21.03.2022.
//

import Foundation

struct FeedResponseWrapped: Decodable {
    let response: FeedResponse
}

struct FeedResponse: Decodable {
    var items: [FeedItem]
}

struct FeedItem: Decodable {
    let sourceId: Int
    let postId: Int
    let text: String?
    let date: Double
    let comments: CoutableItem?
    let likes: CoutableItem?
    let reports: CoutableItem?
    let views: CoutableItem?
}

struct CoutableItem: Decodable {
    let count: Int
}
