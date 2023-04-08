//
//  MovieCell.swift
//  MovieApp
//
//  Created by Yunus Kara on 8.04.2023.
//

import UIKit

final class MovieCell: UICollectionViewCell {
    static let reuseId = "MovieCell"
    
    private var posterImageView: PosterImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureCell()
        configurePosterImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCell(movie: MovieResult){
        posterImageView.getImage(movie: movie)
        
    }
    private func configureCell(){
        backgroundColor = .systemGray5
        layer.cornerRadius = 16
        clipsToBounds = true
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        posterImageView.image = nil
        posterImageView.cancelFetching()
    }
    
    private func configurePosterImageView(){
        posterImageView = PosterImageView(frame: .zero)
        addSubview(posterImageView)
        
        
        posterImageView.pinToEdgesOf(view: self)
    }
    
}
