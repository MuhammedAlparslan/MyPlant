//
//  DetailsManager.swift
//  GreenMood
//
//  Created by Alparslan Cafer on 21.06.2023.
//

import Foundation

class DetailsManager {
    
    static let shared = DetailsManager()
    
    func getPlantDetails(id: Int, completion: @escaping ((DetailsPlant?, String?) -> ())) {
        NetworkManager.shared.request(model: DetailsPlant.self,
                                      url: NetworkHelper.shared.urlConfiqure(path: "species/details/\(id)"),
                                      complete: completion)
        
        
    }
}
