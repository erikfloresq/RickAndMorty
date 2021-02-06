//
//  CharactersTableViewDelegate.swift
//  RickAndMorty
//
//  Created by Erik Flores on 1/02/21.
//

import UIKit

class CharactersTableViewDelegate: NSObject, UITableViewDelegate {
    weak var navigation: UINavigationController?
    let viewModel: MainViewModelable
    
    init(viewModel: MainViewModelable, navigation: UINavigationController?) {
        self.viewModel = viewModel
        self.navigation = navigation
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewModel = DetailViewModel(character: viewModel.characters.value[indexPath.row])
        let detailVC = DetailViewController(viewModel: detailViewModel)
        navigation?.showDetailViewController(detailVC, sender: nil)
    }
}
