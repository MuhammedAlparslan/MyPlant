//
//  DiseaseDetailsViewModel.swift
//  GreenMood
//
//  Created by Alparslan Cafer on 18.07.2023.
//

import Foundation


class DiseaseDetailsViewModel {
    
    var item: DiseaseElement?
    var successCallback : (()->())?
    var errorCallback   : ((String)->())?
    
    
}
