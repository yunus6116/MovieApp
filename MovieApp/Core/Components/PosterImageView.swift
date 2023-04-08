//
//  PosterImageView.swift
//  MovieApp
//
//  Created by Yunus Kara on 8.04.2023.
//

import UIKit

final class PosterImageView: UIImageView {
    private var dataTask: URLSessionDataTask?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func getImage(movie: MovieResult){
        guard let url = URL(string: APIURLs.imageURL(posterPath: movie._posterPath)) else {return}
        
        dataTask = URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else { return }
            
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
        }
        dataTask?.resume()
    }
    
    func cancelFetching(){
        dataTask?.cancel()
        dataTask = nil
    }
}
