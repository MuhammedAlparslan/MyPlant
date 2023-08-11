//
//  Details.swift
//  GreenMood
//
//  Created by Alparslan Cafer on 21.06.2023.
//

import Foundation


// MARK: - DetailsPlant
struct DetailsPlant: Codable {
    let id: Int?
    let commonName: String?
    //    let scientific_name: [String]?
    //    let other_name:  [String]?
    //    let family: String?
    let origin: [String]?
    let type: String?
    let dimension, cycle: String?
    //    let attracts: [String]?
    //    let propagation: [String]?
    //    let hardiness: Hardiness?
    //    let hardiness_location: HardinessLocation?
    //    let watering: String?
    //    let sunlight: [String]?
    //    let maintenance: String?
    let careGuides: String?
    //    let soil: [String]?
    //    let growth_rate: String?
    //    let drought_tolerant, salt_tolerant, thorny, invasive: Bool?
    //    let tropical, indoor: Bool?
    //    let care_level: String?
    //    let pest_susceptibility: [String]?
    //    let pest_susceptibility_api: String?
    //    let flowers: Bool?
    //    let flowering_season: JSONNull?
    //    let flower_color: String?
    //    let cones, fruits, edible_fruit: Bool?
    //    let edible_fruit_taste_profile, fruit_nutritional_value: String?
    //    let fruit_color: [String]?
    //    let harvest_season, harvest_method: String?
    //    let leaf: Bool?
    //    let leaf_color: [String]?
    //    let edible_leaf: Bool?
    //    let edible_leaf_taste_profile, leaf_nutritional_value: String?
    //    let cuisine: Bool?
    //    let cuisine_list: String?
    //    let medicinal: Bool?
    //    let medicinal_use, medicinal_method: String?
    //    let poisonous_to_humans: Int?
    //    let poison_effects_to_humans, poison_to_humans_cure: String?
    //    let poisonous_to_pets: Int?
    //    let poison_effects_to_pets, poison_to_pets_cure, rare, rare_level: String?
    //    let endangered, endangered_level: String?
    let description: String?
    //    let problem: String?
    let defaultImage: DetailsImage?
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case careGuides = "care-guides"
        case commonName = "common_name"
        case defaultImage = "default_image"
        case description
        case dimension
        case cycle
        case origin
        case type
        
        
    }
    
}

// MARK: - DefaultImage
struct DetailsImage: Codable {
    let license: Int?
    let licenseName: String?
    let licenseURL: String?
    let originalURL, regularURL, mediumURL, smallURL: String?
    let thumbnail: String?
    
    enum CodingKeys: String, CodingKey {
        case license
        case licenseName = "license_name"
        case licenseURL = "license_url"
        case originalURL = "original_url"
        case regularURL = "regular_url"
        case mediumURL = "medium_url"
        case smallURL = "small_url"
        case thumbnail
    }
}

// MARK: - Hardiness
//struct Hardiness: Codable {
//    let min, max: String?
//}

// MARK: - HardinessLocation
//struct HardinessLocation: Codable {
//    let full_url: String?
//    let full_iframe: String?
//
//
//}


