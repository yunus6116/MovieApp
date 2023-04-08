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
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: UIHelper.createHomeFlowLayout())
        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        // Extension
        collectionView.pinToEdgesOf(view: view)
    }
    
    func configureVC() {
        view.backgroundColor = .systemBackground
    }
    
}

extension HomeScreen: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        UICollectionViewCell()
    }
    
    
}
