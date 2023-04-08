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
}

struct MovieResult: Decodable {
    let id: Int?
    let posterPath: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case posterPath = "poster_path"
    }
    
    var _id: Int {
        id ?? Int.min
    }
    
    var _posterPath: String {
        posterPath ?? ""
    }
    
}
