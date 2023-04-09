//
//  MovieDetailViewModel.swift
//  MovieApp
//
//  Created by Yunus Kara on 9.04.2023.
//

import Foundation

protocol IMovieDetailViewModel{
    var view: IMovieDetailScreen? { get set }
    
    func viewDidLoad()
    //func configurePosterImageView()
}

final class MovieDetailViewModel {
    weak var view: IMovieDetailScreen?
    
}

extension MovieDetailViewModel: IMovieDetailViewModel{
    func viewDidLoad() {
        view?.configureVC()
        view?.configurePosterImageView()
        view?.getPosterImage()
        view?.configureTitleLabel()
        view?.configureDateLabel()
        view?.configureOverviewLabel()
    }
}
