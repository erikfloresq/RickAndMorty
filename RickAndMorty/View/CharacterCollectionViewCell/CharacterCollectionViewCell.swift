//
//  CharacterCollectionViewCell.swift
//  RickAndMorty
//
//  Created by Erik Flores on 15/02/21.
//

import UIKit

class CharacterCollectionViewCell: UICollectionViewCell {

    override init(frame: CGRect) {
        super.init(frame: frame)
        isAccessibilityElement = true
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
}
