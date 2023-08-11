//
//  DiseaseManager.swift
//  GreenMood
//
//  Created by Alparslan Cafer on 30.06.2023.
//

import Foundation

class DiseaseManager {
    
    static let shared = DiseaseManager()
    
    func getplantDisease(page: Int, completion: @escaping ((Disease?, String?) -> ())) {
        NetworkManager.shared.request(model: Disease.self,
                                      url: DiseaseEndPoint.disease.path + "&page=\(page)",
                                      complete: completion)
        
    }
    
    func getplantDiseaseDetails(completion: @escaping ((Disease?, String?) -> ())) {
        NetworkManager.shared.request(model: Disease.self,
                                      url: DiseaseEndPoint.disease.path,
                                      complete: completion)
        
    }
    
}
