//
//  CharactersTableViewModel.swift
//  RickAndMorty
//
//  Created by Erik Flores on 28/01/21.
//

import Foundation

protocol CharactersTableViewModelProtocol {
    var characters: [String] { get set }
    
    func charactersCount() -> Int
}

class CharactersTableViewModel: CharactersTableViewModelProtocol {
    var characters = [String]()
    
    func charactersCount() -> Int {
        return 5
    }
}
