//
//  DetailsCell.swift
//  GreenMood
//
//  Created by Alparslan Cafer on 21.06.2023.
//

import UIKit
import SDWebImage




class DetailsCell: UICollectionViewCell {
    
    //    MARK: - Properties
    
    @IBOutlet private weak var nameLabel        : UILabel!
    @IBOutlet private weak var titleImage       : UIImageView!
    @IBOutlet private weak var typeLabel        : UILabel!
    @IBOutlet private weak var originLabel      : UILabel!
    @IBOutlet private weak var descriptionInfo  : UITextView!
    @IBOutlet private weak var cycleLabel       : UILabel!
    
    
    //    MARK: - LifeCycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //    MARK: - Helper
    
    
    
    func configureData(data: DetailsPlant) {
        guard let url = data.defaultImage?.regularURL else { return }
        typeLabel.text = data.type
        originLabel.text = data.origin?.first
        descriptionInfo.text = data.description
        nameLabel.text = data.commonName
        cycleLabel.text = data.cycle
        titleImage.loadUrl(url)
    }
    
    
    //    MARK: -  IBAction
    
    
    
    
    
}
