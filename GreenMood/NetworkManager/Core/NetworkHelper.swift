//
//  NetworkHelper.swift
//  GreenMood
//
//  Created by Alparslan Cafer on 18.06.2023.
//


import UIKit

class NetworkHelper {
    
    static let shared = NetworkHelper()
    
    let baseUrl       = "https://perenual.com/api/"
    let apiKey        = "sk-EPse648d7742e6af01274"
    
    func urlConfiqure(path: String) -> String {
        baseUrl + path + "?=&key=\(apiKey)"
        
    }
}
