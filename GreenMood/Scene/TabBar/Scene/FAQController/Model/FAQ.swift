//
//  FAQ.swift
//  GreenMood
//
//  Created by Alparslan Cafer on 23.07.2023.
//

import Foundation


// MARK: - FAQ
struct FAQ: Codable {
    let data: [FAQElement]?
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
struct FAQElement: Codable {
    let id: Int?
    let question, answer: String?
    let tags: [String]?
    let defaultImage: FAQImage?

    enum CodingKeys: String, CodingKey {
        case id, question, answer, tags
        case defaultImage = "default_image"
    }
}

// MARK: - DefaultImage
struct FAQImage: Codable {
    let license: Int?
    let licenseName: String?
    let licenseURL: String?
    let originalURL, regularURL, mediumURL: String?

    enum CodingKeys: String, CodingKey {
        case license
        case licenseName = "license_name"
        case licenseURL = "license_url"
        case originalURL = "original_url"
        case regularURL = "regular_url"
        case mediumURL = "medium_url"
    }
}
