//
//  Disease.swift
//  GreenMood
//
//  Created by Alparslan Cafer on 30.06.2023.
//

import Foundation


// MARK: - Disease
struct Disease: Codable {
    let data: [DiseaseElement]?
    let to, perPage, currentPage, from: Int?
    let lastPage, total: Int?

    enum CodingKeys: String, CodingKey {
        case data, to
        case perPage = "per_page"
        case currentPage = "current_page"
        case from
        case lastPage = "last_page"
        case total
    }
}

// MARK: - Datum
struct DiseaseElement: Codable {
    let id: Int?
    let commonName, scientificName: String?
    let otherName: [String]?
//    let family: JSONNull?
    let description, solution: [Tion]?
    let host: [String]?
    let images: [Image]?

    enum CodingKeys: String, CodingKey {
        case id
        case commonName = "common_name"
        case scientificName = "scientific_name"
        case otherName = "other_name"
//        case family,
        case description, solution, host, images
    }
}

// MARK: - Tion
struct Tion: Codable {
    let subtitle, description: String?
}

// MARK: - Image
struct Image: Codable {
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

