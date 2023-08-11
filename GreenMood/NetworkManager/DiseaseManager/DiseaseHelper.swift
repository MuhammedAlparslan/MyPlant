//
//  DiseaseHelper.swift
//  GreenMood
//
//  Created by Alparslan Cafer on 30.06.2023.
//

import Foundation

enum  DiseaseEndPoint: String {
    case disease  = "pest-disease-list"

    var path: String {
        NetworkHelper.shared.urlConfiqure(path: self.rawValue)
    }
}
