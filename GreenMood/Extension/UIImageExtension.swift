//
//  UIImageExtension.swift
//  GreenMood
//
//  Created by Alparslan Cafer on 18.06.2023.
//

import UIKit
import SDWebImage

extension UIImageView {
    func loadUrl(_ posterPath: String) {
        if let url = URL(string: posterPath) {
            self.sd_setImage(with: url)
        }
    }
}

