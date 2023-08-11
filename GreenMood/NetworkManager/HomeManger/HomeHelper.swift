//
//  HomeHelper.swift
//  GreenMood
//
//  Created by Alparslan Cafer on 18.06.2023.
//

import Foundation

enum HomeEndPoint: String {
    case speciesList = "species-list"
    
    var path: String {
        NetworkHelper.shared.urlConfiqure(path: self.rawValue)
    }
    
}
