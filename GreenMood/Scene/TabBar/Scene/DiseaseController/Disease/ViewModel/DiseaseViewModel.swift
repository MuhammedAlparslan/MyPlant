//
//  DiseaseViewModel.swift
//  GreenMood
//
//  Created by Alparslan Cafer on 30.06.2023.
//

import Foundation

class DiseaseViewModel {
    
    var text = String() {
        didSet {
            fetchData()
        }
    }
    
    var items = [DiseaseElement]()
    
    var successCallback: (()->())?
    var errorCallback: ((String)->())?
    var plant: Disease?
    
    
    func fetchData() {
        DiseaseManager.shared.getplantDisease(page: (plant?.currentPage ?? 0) + 1) { plantList, errorMessage in
            if let errorMessage = errorMessage {
                self.errorCallback?(errorMessage)
            } else if let plantList = plantList {
                self.items.append(contentsOf: plantList.data ?? [])
                self.plant = plantList
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
