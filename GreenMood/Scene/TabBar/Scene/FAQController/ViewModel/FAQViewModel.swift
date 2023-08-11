//
//  FAQViewModel.swift
//  GreenMood
//
//  Created by Alparslan Cafer on 23.07.2023.
//

import Foundation

class FAQViewModel {
    
    
    var items = [FAQElement]()
    
    var successCallback: (()->())?
    var errorCallback: ((String)->())?
    var plant: FAQ?
    
    
    func fetchData() {
        FAQManager.shared.getFaqQuestion(page: (plant?.currentPage ?? 0) + 1) { faqList, errorMessage in
            if let errorMessage = errorMessage {
                self.errorCallback?(errorMessage)
            } else if let faqList = faqList {
                self.items.append(contentsOf: faqList.data ?? [])
                self.plant = faqList
                self.successCallback?()
            } else {
                self.items.removeAll()
                self.successCallback?()
                
            }
        }
    }
    
    
    func pagination(index: Int) {
        if (index == items.count - 1) && (plant?.currentPage ?? 0 <= plant?.lastPage ?? 0 ) {
            fetchData()
        }
    }
    
    func reset() {
        items.removeAll()
        plant = nil
    }
}
