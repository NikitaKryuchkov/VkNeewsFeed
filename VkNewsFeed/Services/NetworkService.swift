//
//  NetworkService.swift
//  VkNewsFeed
//
//  Created by Nikita Kryuchkov on 14.03.2022.
//

import Foundation

final class NetworkService {
    
    private let authService: AuthService
    
    init(authService: AuthService = SceneDelegate.shared().authService) {
        self.authService = authService
    }
    
    func getFeed() {
        var components = URLComponents()
        
        guard let token = authService.token else { return }
        
        let params = ["filters": "post,photo"]
        var allParams = params
        allParams["access_token"] = token
        allParams["v"] = API.version
        
        components.scheme = API.scheme
        components.host = API.host
        components.path = API.newsFeed
        components.queryItems = allParams.map { URLQueryItem(name: $0, value: $1) }
        
        guard let url = components.url else { return }
        print(url)
    }
}
