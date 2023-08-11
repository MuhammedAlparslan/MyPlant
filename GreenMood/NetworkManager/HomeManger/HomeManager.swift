//
//  HomeManager.swift
//  GreenMood
//
//  Created by Alparslan Cafer on 18.06.2023.
//

import Foundation

class HomeManager {
    
    static let shared = HomeManager()
    
    
    func getPlantList(completion: @escaping ((Plant?, String?) -> ())) {
        NetworkManager.shared.request(model: Plant.self,
                                      url: HomeEndPoint.speciesList.path,
                                      complete: completion)
    }
    
    func getPlantListpAGE(page: Int, complete: @escaping ((Plant?, String?) -> ())) {
        NetworkManager.shared.request(model: Plant.self,
                                      url: HomeEndPoint.speciesList.path + "&page=\(page)",
                                      complete: complete)
    }
    
    func getSearchPlant(q: String, page: Int, complete: @escaping ((Plant?, String?) -> ())) {
        NetworkManager.shared.request(model: Plant.self,
                                      url: HomeEndPoint.speciesList.path + "&q=\(q)" + "&page=\(page)",
                                      complete: complete)
        
    }
    
}
