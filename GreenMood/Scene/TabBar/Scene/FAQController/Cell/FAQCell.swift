//
//  FAQCell.swift
//  GreenMood
//
//  Created by Alparslan Cafer on 23.07.2023.
//

import UIKit

class FAQCell: UITableViewCell {

    @IBOutlet private weak var questionLabel: UILabel!
    
    func configureData(data: FAQElement) {
        questionLabel.text = data.question
    }
}
