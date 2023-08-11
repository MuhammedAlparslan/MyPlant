//
//  Home.swift
//  GreenMood
//
//  Created by Alparslan Cafer on 18.06.2023.
//

import Foundation


//struct ProfileUser {
//    let email       : String
//    let fullname    : String
//    var profileImage: String
//    let uid         : String
//
//    var isCurrentUser: Bool { return Auth.auth().currentUser?.uid == uid}
//
//    init(uid: String, dictionary: [String: AnyObject]) {
//        self.uid = uid
//
//        self.fullname     = dictionary["fullname"]      as? String ?? ""
//        self.email        = dictionary["email"]         as? String ?? ""
//        self.profileImage = dictionary["profileImage"]  as? String ?? ""
//
//
//        }
//    }



// MARK: - Plant
struct Plant: Codable {
    let data        : [PlantElment]?
    let to          : Int?
    let per_page    : Int?
    let current_page: Int?
    let from        : Int?
    let last_page   : Int?
    let total       : Int?
    
    
}

// MARK: - PlantElment

struct PlantElment: Codable {
    let id              : Int?
    let common_name     : String?
    let scientific_name : [String]?
    let other_name      : [String]?
    //    let cycle: String?
    //    let watering: String?
    //    let sunlight: String?
    let default_image   : DefaultImage?
    
    
}



// MARK: - DefaultImage
struct DefaultImage: Codable {
    //    let license: Int?
    //    let license_name: String?
    //    let license_url: String?
    //    let original_url: String?
    let regular_url : String?
    //    let medium_url: String?
    let small_url   : String?
    let thumbnail   : String?
}

