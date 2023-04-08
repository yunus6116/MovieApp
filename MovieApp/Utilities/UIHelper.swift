//
//  UIHelper.swift
//  MovieApp
//
//  Created by Yunus Kara on 8.04.2023.
//

import UIKit

enum UIHelper {
   static func createHomeFlowLayout() -> UICollectionViewFlowLayout {
       let layout = UICollectionViewFlowLayout()
       
       let itemWidth = CGFloat.dWidth
       layout.scrollDirection = .vertical
       layout.itemSize = CGSize(width: itemWidth, height: itemWidth * 1.5)
       //layout.sectionInset = UIEdgeInsets(top: 30, left: 10, bottom: 30, right: 10)
       
       return layout
    }
}
