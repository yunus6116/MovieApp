//
//  HomeViewModel.swift
//  MovieApp
//
//  Created by Yunus Kara on 8.04.2023.
//

import Foundation

protocol IHomeViewModel{
    var view: IHomeScreen?{get set}
    func viewDidLoad()
}

final class HomeViewModel {
    weak var view: IHomeScreen?
}

extension HomeViewModel: IHomeViewModel{
    func viewDidLoad() {
        view?.configureVC()
        view?.configureCollectionView()
        print("viewDidLoad")
    }
    
}
