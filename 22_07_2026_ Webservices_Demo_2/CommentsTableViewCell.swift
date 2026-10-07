//
//  CommentsTableViewCell.swift
//  22_07_2026_ Webservices_Demo_2
//
//  Created by Vishal Jagtap on 07/10/26.
//

import UIKit

class CommentsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var commentBodyLabel: UILabel!
    @IBOutlet weak var commentLikesLabel: UILabel!
    @IBOutlet weak var userFullNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
