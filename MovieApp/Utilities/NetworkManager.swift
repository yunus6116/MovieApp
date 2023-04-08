//
//  NetworkManager.swift
//  MovieApp
//
//  Created by Yunus Kara on 8.04.2023.
//

import Foundation

class NetworkManager{
    static let shared = NetworkManager()
    private init() {}
    
    func download(url: URL, completion: @escaping (Result<Data,Error>) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(.failure(error))
                return
            }
            
            guard
                let response = response as? HTTPURLResponse,
                response.statusCode == 200 else {
                
                completion(.failure(URLError(.badServerResponse)))
                return
                
            }
            
            guard let data = data else {
                
                completion(.failure(URLError(.badURL)))
                return
            }
            completion(.success(data))
        }
        .resume()
    }
}
