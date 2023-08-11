//
//  FAQEndPoint.swift
//  GreenMood
//
//  Created by Alparslan Cafer on 23.07.2023.
//

import Foundation

enum  FAQEndPoint: String {
    case faq  = "article-faq-list"
    
    var path: String {
        NetworkHelper.shared.urlConfiqure(path: self.rawValue)
    }
}
