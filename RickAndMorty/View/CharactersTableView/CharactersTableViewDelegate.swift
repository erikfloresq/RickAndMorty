//
//  CharactersTableViewDelegate.swift
//  RickAndMorty
//
//  Created by Erik Flores on 1/02/21.
//

import UIKit
import Combine

enum CharacterDelegateError: Error {
    case didSelected
}

class CharactersTableViewDelegate: NSObject, UITableViewDelegate {
    weak var navigation: UINavigationController?
    let viewModel: MainViewModelable
    var selectAction = PassthroughSubject<Character, Never>()
    
    init(viewModel: MainViewModelable) {
        self.viewModel = viewModel
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectAction.send(viewModel.characters.value[indexPath.row])
    }
}
