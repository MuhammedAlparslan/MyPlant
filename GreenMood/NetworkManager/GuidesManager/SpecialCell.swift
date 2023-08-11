//
//  SpecialCell.swift
//  GreenMood
//
//  Created by Alparslan Cafer on 23.06.2023.
//

import UIKit

class SpecialCell: UITableViewCell {

    @IBOutlet private weak var nameLabel: UILabel!
    
    
    func configureData(data: PlantElment) {
        nameLabel.text = data.common_name
    }
    
}
