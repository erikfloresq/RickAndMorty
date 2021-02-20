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
        collectionViewLayout = configListLayout()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    func configListLayout() -> UICollectionViewLayout {
        let listConfig = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        let listLayout = UICollectionViewCompositionalLayout.list(using: listConfig)
        return listLayout
    }
    
}
