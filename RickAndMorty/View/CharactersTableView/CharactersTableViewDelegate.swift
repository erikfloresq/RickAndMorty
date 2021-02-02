//
//  CharactersTableViewDelegate.swift
//  RickAndMorty
//
//  Created by Erik Flores on 1/02/21.
//

import UIKit

class CharactersTableViewDelegate: NSObject, UITableViewDelegate {
    weak var navigation: UINavigationController?
    let viewModel: MainViewModelProtocol
    
    init(viewModel: MainViewModelProtocol, navigation: UINavigationController?) {
        self.viewModel = viewModel
        self.navigation = navigation
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewModel = DetailViewModel(image: viewModel.characters.value[indexPath.row].image)
        let detailVC = DetailViewController(viewModel: detailViewModel)
        navigation?.showDetailViewController(detailVC, sender: nil)
    }
}
