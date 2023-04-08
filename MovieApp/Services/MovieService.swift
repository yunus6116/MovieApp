//
//  MovieService.swift
//  MovieApp
//
//  Created by Yunus Kara on 8.04.2023.
//

import Foundation

class MovieService {
    
    func getMovies(completion: @escaping ([MovieResult]?)-> ()){
        guard let url = URL(string:"https://api.themoviedb.org/3/movie/popular?api_key=e04bb48dd8aedc038d0e25235f2456c4&language=en-US&page=1") else {return}
        
        NetworkManager.shared.download(url: url, completion: {[weak self] result in
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
}
