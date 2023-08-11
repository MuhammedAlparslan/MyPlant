//
//  DetailsHelper.swift
//  GreenMood
//
//  Created by Alparslan Cafer on 22.06.2023.
//

import Foundation


enum  DetailsEndPoint: String {
    case details  = "species/details/"

    var path: String {
        NetworkHelper.shared.urlConfiqure(path: self.rawValue)
    }
}
