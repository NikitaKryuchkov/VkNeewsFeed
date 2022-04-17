//
//  NeewsfeedCellLayoutCalculator.swift
//  VkNewsFeed
//
//  Created by Nikita Kryuchkov on 17.04.2022.
//

import Foundation
import UIKit

struct Size: FeedCellSizes {
    var postLabelFrame: CGRect
    var attachmentFrame: CGRect
    var bottomView: CGRect
    var totalHeight: CGFloat
}

struct Constants {
    static let cardInsets = UIEdgeInsets(top: 0, left: 8, bottom: 12, right: 0)
    static let topViewHeight: CGFloat = 43
    static let postLableInsets = UIEdgeInsets(top: 8 + Constants.topViewHeight + 8, left: 8, bottom: 8, right: 8)
    static let postLableFont = UIFont.systemFont(ofSize: 15)
}

protocol FeedCellLayoutCelculatorProtocol {
    func sizes(postText: String?, photoAttachment: FeedCeelPhotoAttachmentViewModal?) -> FeedCellSizes
}

final class NeewsfeedCellLayoutCalculator: FeedCellLayoutCelculatorProtocol {
    
    private let screenWith: CGFloat
    
    init(screenWith: CGFloat = min(UIScreen.main.bounds.width, UIScreen.main.bounds.height)) {
        self.screenWith = screenWith
    }
    
    func sizes(postText: String?, photoAttachment: FeedCeelPhotoAttachmentViewModal?) -> FeedCellSizes {
        let cardViewWidth = screenWith - Constants.cardInsets.left - Constants.cardInsets.right
        
        var postLableFrame = CGRect(
            origin: CGPoint(x: Constants.postLableInsets.left, y: Constants.postLableInsets.top),
            size: CGSize.zero
        )
        
        if let postText = postText, !postText.isEmpty {
            let width = cardViewWidth - Constants.postLableInsets.left - Constants.postLableInsets.right
            let height = postText.height(width: width, font: Constants.postLableFont)
            
            postLableFrame.size = CGSize(width: width, height: height)
        }
        
        return Size(
            postLabelFrame: postLableFrame,
            attachmentFrame: CGRect.zero,
            bottomView: CGRect.zero,
            totalHeight: 300
        )
    }
 }
