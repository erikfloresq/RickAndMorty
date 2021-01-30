//
//  CharactersTableViewModel.swift
//  RickAndMorty
//
//  Created by Erik Flores on 28/01/21.
//

import Foundation

protocol CharactersTableViewModelProtocol {
    var characters: [Character] { get set }
    
    func charactersCount() -> Int
}

class CharactersTableViewModel: CharactersTableViewModelProtocol {
    let networking = Networking()
    
    var characters = [Character]()
    
    func charactersCount() -> Int {
        return characters.count
    }
    
    func getCharacters() {
        networking.request(url: RickAndMortyAPI.characters) { result in
            switch result {
            case .success(let characters):
                self.characters = characters
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
