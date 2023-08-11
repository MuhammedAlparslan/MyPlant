//
//  DiseaseCell.swift
//  GreenMood
//
//  Created by Alparslan Cafer on 30.06.2023.
//

import UIKit

class DiseaseCell: UITableViewCell {

    @IBOutlet private weak var nameLabel: UILabel!
    

    func configureData(data: DiseaseElement) {
        nameLabel.text = data.commonName
    }
}
