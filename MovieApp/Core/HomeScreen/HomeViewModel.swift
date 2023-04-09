//
//  HomeViewModel.swift
//  MovieApp
//
//  Created by Yunus Kara on 8.04.2023.
//

import Foundation

protocol IHomeViewModel{
    var view: IHomeScreen? { get set }
    
    func viewDidLoad()
    func getMovies()
}

final class HomeViewModel {
    weak var view: IHomeScreen?
    private let service = MovieService()
    var movies: [MovieResult] = []
    private var page: Int = 1
}

extension HomeViewModel: IHomeViewModel{
    func viewDidLoad() {
        view?.configureVC()
        view?.configureCollectionView()
        getMovies()
    }
    
    func getMovies() {
        service.getMovies(page: page) { [weak self] returnedMovies in
            guard let self = self else {return}
            guard let returnedMovies = returnedMovies else {return}
            
            self.movies.append(contentsOf: returnedMovies)
            self.page += 1
            self.view?.reloadCollectionView()
        }
    }
    
    func getMovieDetail(id: Int){
        service.getMovieDetail(id: id) { [weak self] returnedMovieDetail in
            guard let self = self else {return}
            guard let returnedMovieDetail = returnedMovieDetail else { return }
            
            self.view?.navigateToDetailScreen(movie: returnedMovieDetail)
        }
        
    }
    
}
