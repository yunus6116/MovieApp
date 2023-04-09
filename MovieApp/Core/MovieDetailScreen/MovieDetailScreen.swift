//
//  MovieDetailScreen.swift
//  MovieApp
//
//  Created by Yunus Kara on 9.04.2023.
//

import UIKit


protocol IMovieDetailScreen: AnyObject {
    
}

final class MovieDetailScreen: UIViewController {
    
    private let movie: MovieDetail
    
    private let viewModel = MovieDetailViewModel()
    
    init(movie: MovieDetail){
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        view.backgroundColor = .white
        title = movie.title ?? "Movie"
    }
    
    
}

extension MovieDetailScreen: IMovieDetailScreen {
    
}
