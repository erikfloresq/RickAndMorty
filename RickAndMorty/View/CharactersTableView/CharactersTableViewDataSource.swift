//
//  CharactersTableViewDataSource.swift
//  RickAndMorty
//
//  Created by Erik Flores on 28/01/21.
//

import UIKit

class CharactersTableViewDataSource: NSObject, UITableViewDataSource {
    let viewModel: MainViewModelProtocol
    
    init(viewModel: MainViewModelProtocol) {
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
        cell.bindData(photo: "", name: viewModel.characters.value[indexPath.row].name)
        return cell
    }
}
