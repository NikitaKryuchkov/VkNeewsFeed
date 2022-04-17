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
        return Size(postLabelFrame: CGRect.zero, attachmentFrame: CGRect.zero)
    }
 }
