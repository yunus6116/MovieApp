//
//  UICollectionView+Ext.swift
//  MovieApp
//
//  Created by Yunus Kara on 9.04.2023.
//

import UIKit

extension UICollectionView{
    func reloadOnMainThread(){
        DispatchQueue.main.async{
            self.reloadData()
        }
    }
}
