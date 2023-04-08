//
//  HomeScreen.swift
//  MovieApp
//
//  Created by Yunus Kara on 8.04.2023.
//

import UIKit

protocol IHomeScreen: AnyObject{
    func configureVC()
    func configureCollectionView()
    func reloadCollectionView()
}


final class HomeScreen: UIViewController {
    
    private let viewModel = HomeViewModel()
    
    private var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad()
    }
}

extension HomeScreen: IHomeScreen{
    func reloadCollectionView() {
        collectionView.reloadOnMainThread()
    }
    
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: UIHelper.createHomeFlowLayout())
        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MovieCell.self, forCellWithReuseIdentifier: MovieCell.reuseId)
        
        // Extension
        collectionView.pinToEdgesOf(view: view)
    }
    
    func configureVC() {
        view.backgroundColor = .systemBackground
    }
    
}

extension HomeScreen: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCell.reuseId, for: indexPath) as! MovieCell
        
        cell.setCell(movie: viewModel.movies[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(APIURLs.detailURL(id: viewModel.movies[indexPath.item]._id))
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        
        if offsetY >= contentHeight - height * 2{
            viewModel.getMovies()
        }
    }
}
