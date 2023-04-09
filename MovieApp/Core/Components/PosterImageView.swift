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
        
        dataTask = NetworkManager.shared.get(url: url) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.image = UIImage(data: data)
                }
            case .failure(_):
                break
            }
        }
        dataTask?.resume()
    }
    
    func getImage(movie: MovieDetail){
        guard let url = URL(string: APIURLs.imageURL(posterPath: movie._posterPath)) else {return}
        
        dataTask = NetworkManager.shared.get(url: url) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.image = UIImage(data: data)
                }
            case .failure(_):
                break
            }
        }
    }

    
    func cancelFetching(){
        dataTask?.cancel()
        dataTask = nil
    }
}
