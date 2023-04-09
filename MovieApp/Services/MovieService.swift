//
//  MovieService.swift
//  MovieApp
//
//  Created by Yunus Kara on 8.04.2023.
//

import Foundation

final class MovieService {
    
    func getMovies(page: Int , completion: @escaping ([MovieResult]?)-> ()){
        guard let url = URL(string:APIURLs.movies(page: page)) else {return}
        
        NetworkManager.shared.get(url: url, completion: {[weak self] result in
            guard let self = self else {return}
            switch result {
            case .success(let data):
                completion(self.handleWithData(data))
            case .failure(let error):
                self.handleWithError(error)
            }
        })
    }
    
    func getMovieDetail(id: Int, completion: @escaping (MovieDetail?) ->()){
        guard let url = URL(string:APIURLs.detailURL(id: id)) else {return}
        
        NetworkManager.shared.get(url: url, completion: {[weak self] result in
            guard let self = self else {return}
            switch result {
            case .success(let data):
                completion(self.handleWithData(data))
            case .failure(let error):
                self.handleWithError(error)
            }
        })
    }
    
    private func handleWithError(_ error: Error){
        print(error.localizedDescription)
    }
    
    private func handleWithData(_ data: Data) -> [MovieResult]? {
        do {
            let movie = try JSONDecoder().decode(Movie.self, from: data)
            return movie.results
        } catch  {
            print(error)
            return nil
        }
    }
    
    // Polymorphism 
    private func handleWithData(_ data: Data) -> MovieDetail? {
        do {
            let movie = try JSONDecoder().decode(MovieDetail.self, from: data)
            return movie
        } catch  {
            print(error)
            return nil
        }
    }
}
