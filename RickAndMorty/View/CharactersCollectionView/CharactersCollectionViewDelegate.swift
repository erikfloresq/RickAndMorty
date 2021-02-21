//
//  CharactersCollectionViewDelegate.swift
//  RickAndMorty
//
//  Created by Erik Flores on 21/02/21.
//

import UIKit
import Combine

enum CharacterDelegateError: Error {
    case didSelected
}

class CharactersCollectionViewDelegate: NSObject, UICollectionViewDelegate {
    weak var navigation: UINavigationController?
    let viewModel: MainViewModelable
    var selectAction = PassthroughSubject<Character, Never>()
    
    init(viewModel: MainViewModelable) {
        self.viewModel = viewModel
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectAction.send(viewModel.characters.value[indexPath.row])
    }
}
