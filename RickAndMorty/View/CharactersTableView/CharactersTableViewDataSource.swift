//
//  CharactersTableViewDataSource.swift
//  RickAndMorty
//
//  Created by Erik Flores on 28/01/21.
//

import UIKit

class CharactersTableViewDataSource: NSObject, UITableViewDataSource {
    let viewModel: MainViewModelable
    
    init(viewModel: MainViewModelable) {
        self.viewModel = viewModel
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.charactersCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dequeueCell = tableView.dequeueReusableCell(withIdentifier: "CharacterTableViewCell", for: indexPath)
        guard let cell = dequeueCell as? CharacterTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(photoUrl: viewModel.characters.value[indexPath.row].image,
                      name: viewModel.characters.value[indexPath.row].name)
        return cell
    }
}
