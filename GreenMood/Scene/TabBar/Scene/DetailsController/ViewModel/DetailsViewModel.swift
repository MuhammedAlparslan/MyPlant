//
//  DetailsViewModel.swift
//  GreenMood
//
//  Created by Alparslan Cafer on 21.06.2023.
//

import Foundation


class DetailsViewModel {
    
    var plant: DetailsPlant?
    var successCallback : (()->())?
    var errorCallback   : ((String)->())?
    var plantID         : Int?
    
    
    func getPlantDetails() {
        DetailsManager.shared.getPlantDetails(id: plantID ?? 0) { plantDetails, errorMessage in
            if let errorMessage = errorMessage {
                self.errorCallback?(errorMessage)
            } else if let plantDetails = plantDetails {
                self.plant = plantDetails
                self.successCallback?()
            }
        }
    }
}





