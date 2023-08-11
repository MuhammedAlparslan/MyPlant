//
//  FAQManager.swift
//  GreenMood
//
//  Created by Alparslan Cafer on 23.07.2023.
//

import Foundation

class FAQManager {
    
    static let shared = FAQManager()
    
    func getFaqQuestion(page: Int, completion: @escaping ((FAQ?, String?) -> ())) {
        NetworkManager.shared.request(model: FAQ.self,
                                      url: FAQEndPoint.faq.path + "&page=\(page)",
                                      complete: completion)
        
    }
}
