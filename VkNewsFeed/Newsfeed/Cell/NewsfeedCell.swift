//
//  NewsfeedCell.swift
//  VkNewsFeed
//
//  Created by Nikita Kryuchkov on 28.03.2022.
//

import Foundation
import UIKit


class NewsfeedCell: UITableViewCell {
    
    static let reuseId = "NewsfeedCell"
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var dateLable: UILabel!
    @IBOutlet weak var pastLable: UILabel!
    @IBOutlet weak var likesLable: UILabel!
    @IBOutlet weak var commentsLable: UILabel!
    @IBOutlet weak var sharesLable: UILabel!
    @IBOutlet weak var viewsLable: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
