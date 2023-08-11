//
//  SearchViewModel.swift
//  GreenMood
//
//  Created by Alparslan Cafer on 23.06.2023.
//

import UIKit




class SearchViewModel {
    
    var text = String() {
        didSet {
            items.removeAll()
            fetchData()
        }
    }
    
    var items = [PlantElment]()
    var copyitems = [PlantElment]()
    
    var plant : Plant?
    
    var successCallback: (()->())?
    var errorCallback: ((String)->())?
    
    func fetchData() {
        HomeManager.shared.getSearchPlant(q: text, page: (plant?.current_page ?? 0) + 1) { plantList, errorMessage in
            if let errorMessage = errorMessage {
                self.errorCallback?(errorMessage)
            } else if let plantList = plantList {
                self.items.append(contentsOf: plantList.data ?? [])
                self.copyitems = self.items
                self.plant = plantList
                self.successCallback?()
            }
        }
    }
    
    func pagination(index: Int) {
                if (index == items.count - 1) && (plant?.current_page ?? 0 <= plant?.last_page ?? 0 ) {
                    fetchData()
                }
    }
    
    func reset() {
        items.removeAll()
        plant = nil
    }
}
