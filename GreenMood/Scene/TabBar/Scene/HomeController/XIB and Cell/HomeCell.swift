//
//  HomeCell.swift
//  GreenMood
//
//  Created by Alparslan Cafer on 20.06.2023.
//

import UIKit
import SDWebImage

class HomeCell: UICollectionViewCell {

//    MARK: - Properties
    
    @IBOutlet private weak var typeLabel    : UILabel!
    @IBOutlet private weak var titleImage   : UIImageView!
    @IBOutlet private weak var titleView    : UIView!
    //    MARK: - LifeCycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
//    MARK: - Helper
    
    func configureData(data: PlantElment) {
        guard let url = data.default_image?.regular_url  else { return }
        typeLabel.text = data.common_name
        titleImage.loadUrl(url)
    }

}
