//
//  HomeViewModel.swift
//  MovieApp
//
//  Created by Yunus Kara on 8.04.2023.
//

import Foundation

protocol IHomeViewModel{
    var view: IHomeScreen?{get set}
    
    func viewDidLoad()
    func getMovies()
}

final class HomeViewModel {
    weak var view: IHomeScreen?
    private let service = MovieService()
    var movies: [MovieResult] = []
}

extension HomeViewModel: IHomeViewModel{
    func viewDidLoad() {
        view?.configureVC()
        view?.configureCollectionView()
        getMovies()
    }
    
    func getMovies() {
        service.getMovies { [weak self] returnedMovies in
            guard let self = self else {return}
            guard let returnedMovies = returnedMovies else {return}
            
            self.movies = returnedMovies
            print(returnedMovies)
        }
    }
    
}
