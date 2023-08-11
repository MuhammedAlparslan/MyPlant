//
//  FaqDetailsCell.swift
//  GreenMood
//
//  Created by Alparslan Cafer on 23.07.2023.
//

import UIKit


protocol TagCellProtocol {
    var tagItems: [String] { get }
}
class FaqDetailsCell: UICollectionViewCell {

    @IBOutlet private weak var faqImageView     : UIImageView!
    @IBOutlet private weak var textInfo         : UITextView!
    
    func configureData(data: FAQElement) {
        guard let url = data.defaultImage?.originalURL else { return }
        textInfo.text = data.answer
        faqImageView.loadUrl(url)
    }
}

