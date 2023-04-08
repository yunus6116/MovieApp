//
//  Movie.swift
//  MovieApp
//
//  Created by Yunus Kara on 8.04.2023.
//

import Foundation

// Structures are value types. Do not support inheritance. Structure properties are stored on the stack
// Codable -> Encodable & Decodable

struct Movie: Decodable {
    let page: Int?
    let results: [MovieResult]?
    let totalPages, totalResults: Int?
    
    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

struct MovieResult: Decodable {
    let id: Int?
    let posterPath: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case posterPath = "poster_path"
    }
}
