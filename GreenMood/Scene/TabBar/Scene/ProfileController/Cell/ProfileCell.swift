//
//  ProfileCell.swift
//  GreenMood
//
//  Created by Alparslan Cafer on 11.08.2023.
//

import UIKit

class ProfileCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var titleImage: UIImageView!
    
    
    func configureData(data: Profile) {
        nameLabel.text = data.name
        titleImage.image = data.image
    }
}
