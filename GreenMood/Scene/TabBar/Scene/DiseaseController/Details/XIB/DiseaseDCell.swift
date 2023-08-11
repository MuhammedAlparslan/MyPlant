//
//  DiseaseDCell.swift
//  GreenMood
//
//  Created by Alparslan Cafer on 18.07.2023.
//

import UIKit

class DiseaseDCell: UICollectionViewCell {
    
    @IBOutlet private weak var titleImage: UIImageView!
    @IBOutlet private weak var titleDescription: UILabel!
    @IBOutlet private weak var titleInfo: UITextView!
    
    
    func configureData(data: DiseaseElement) {
        guard let url = data.images?.first?.regularURL else { return }
        titleDescription.text = data.solution?.first?.subtitle
        titleInfo.text = data.solution?.first?.description
        titleImage.loadUrl(url)
    }
}
