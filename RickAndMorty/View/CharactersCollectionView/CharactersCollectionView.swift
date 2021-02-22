//
//  CharactersCollectionView.swift
//  RickAndMorty
//
//  Created by Erik Flores on 15/02/21.
//

import UIKit

class CharactersCollectionView: UICollectionView {

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: UICollectionViewLayout())
        accessibilityIdentifier = "CharactersCollectionView"
        if Config.gridLayout {
            collectionViewLayout = configComposableLayout()
        } else {
            collectionViewLayout = configListLayout()
        }
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    func configListLayout() -> UICollectionViewLayout {
        let listConfig = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        let listLayout = UICollectionViewCompositionalLayout.list(using: listConfig)
        return listLayout
    }
    
    func configComposableLayout() -> UICollectionViewCompositionalLayout {
        //let fullSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(2/3))
        let pairItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                  heightDimension: .fractionalHeight(0.5))
        let mainSize = NSCollectionLayoutSize(widthDimension: .fractionalHeight(2/3),
                                              heightDimension: .fractionalHeight(1))
        let trailingSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/3),
                                                  heightDimension: .fractionalHeight(1.0))
        let principalSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(4/9))
        
        //let fullPhotoItem = NSCollectionLayoutItem(layoutSize: fullSize)
        let mainItem = NSCollectionLayoutItem(layoutSize: mainSize)
        let pairItem = NSCollectionLayoutItem(layoutSize: pairItemSize)
        
        let trailingGroup = NSCollectionLayoutGroup.vertical(layoutSize: trailingSize,
                                                             subitem: pairItem,
                                                             count: 2)
        let principalGroup = NSCollectionLayoutGroup.horizontal(layoutSize: principalSize,
                                                                subitems: [mainItem, trailingGroup])
        let section = NSCollectionLayoutSection(group: principalGroup)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
        
    }
    
}
