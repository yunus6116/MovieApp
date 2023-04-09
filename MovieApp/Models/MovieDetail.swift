//
//  MovieDetail.swift
//  MovieApp
//
//  Created by Yunus Kara on 9.04.2023.
//
import Foundation

// Structures are value types. Do not support inheritance. Structure properties are stored on the stack
// Codable -> Encodable & Decodable

struct MovieDetail: Decodable {
    let id: Int?
    let posterPath: String?
    let overview, releaseDate, title: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case posterPath = "poster_path"
        case overview, title
        case releaseDate = "release_date"
    }
    
    var _id: Int {
        id ?? Int.min
    }
    
    var _posterPath: String {
        posterPath ?? ""
    }
    
    var _title: String {
        title ?? "N/A"
    }
    
    var _overview: String {
        overview ?? "N/A"
    }
    
    var _releaseDate: String {
        releaseDate ?? "There is no overview!"
    }
    
}
