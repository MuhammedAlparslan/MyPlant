//
//  HomeViewModel.swift
//  GreenMood
//
//  Created by Alparslan Cafer on 18.06.2023.
//

import UIKit

class HomeViewModel {
    
    var items = [PlantElment]()
    var successCallback: (()->())?
    var errorCallback: ((String)->())?
    var plant: Plant?
    
    func fetchData() {
        HomeManager.shared.getPlantListpAGE(page: (plant?.current_page ?? 0) + 1) { plantList, errorMessage in
            if let errorMessage = errorMessage  {
                self.errorCallback?(errorMessage)
            } else if let plantList = plantList {
                self.plant = plantList
                self.items.append(contentsOf: plantList.data ?? [])
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
