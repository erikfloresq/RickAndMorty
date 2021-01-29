//
//  CharactersTableViewDataSource.swift
//  RickAndMorty
//
//  Created by Erik Flores on 28/01/21.
//

import UIKit

class CharactersTableViewDataSource: NSObject, UITableViewDataSource {
    let viewModel: CharactersTableViewModelProtocol
    
    init(viewModel: CharactersTableViewModelProtocol = CharactersTableViewModel()) {
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
        return cell
    }
}
