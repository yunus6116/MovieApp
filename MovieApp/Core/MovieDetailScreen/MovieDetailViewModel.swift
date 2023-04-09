//
//  MovieDetailViewModel.swift
//  MovieApp
//
//  Created by Yunus Kara on 9.04.2023.
//

import Foundation

protocol IMovieDetailViewModel{
    var view: IMovieDetailScreen? { get set }
}

final class MovieDetailViewModel {
    weak var view: IMovieDetailScreen?
    
}

extension MovieDetailViewModel: IMovieDetailViewModel{
    
    
}
