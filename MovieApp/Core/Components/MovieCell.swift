//
//  MovieCell.swift
//  MovieApp
//
//  Created by Yunus Kara on 8.04.2023.
//

import UIKit

class MovieCell: UICollectionViewCell {
    static let reuseId = "MovieCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCell(){
        backgroundColor = .systemGray5
        layer.cornerRadius = 16
    }
    
}
