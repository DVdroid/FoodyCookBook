//
//  MealTableViewCell.swift
//  FoodyCookBook
//
//  Created by Vikash Anand on 26/07/21.
//

import UIKit

class MealTableViewCell: UITableViewCell {

    @IBOutlet var thumbnailImageView: UIImageView! {
        didSet {
            thumbnailImageView.layer.cornerRadius = 20.0
        }
    }
    
    @IBOutlet var headerLabel: UILabel!
    @IBOutlet var subHeaderLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
