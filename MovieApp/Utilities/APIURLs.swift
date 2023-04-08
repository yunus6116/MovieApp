//
//  APIURLs.swift
//  MovieApp
//
//  Created by Yunus Kara on 8.04.2023.
//

import Foundation

enum APIURLs {
    static func movies(page: Int) -> String {
        "https://api.themoviedb.org/3/movie/popular?api_key=e04bb48dd8aedc038d0e25235f2456c4&language=en-US&page=\(page)"
    }
    
    static func imageURL(posterPath: String) -> String {
        "https://image.tmdb.org/t/p/w500\(posterPath)"
    }
    
    static func detailURL(id: Int) -> String {
        "https://api.themoviedb.org/3/movie/\(id)?api_key=e04bb48dd8aedc038d0e25235f2456c4&language=en-US"
    }
}
