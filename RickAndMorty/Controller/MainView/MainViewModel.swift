//
//  MainViewModel.swift
//  RickAndMorty
//
//  Created by Erik Flores on 30/01/21.
//

import Foundation

protocol MainViewModelable {
    var characters: Observable<[Character]> { get set }
    
    func charactersCount() -> Int
    func getCharacters()
}

class MainViewModel: MainViewModelable {
    var characters: Observable<[Character]> = Observable<[Character]>([])
    private let networking: NetworkingProtocol
    
    init(networking: NetworkingProtocol) {
        self.networking = networking
    }
    
    func charactersCount() -> Int {
        return characters.value.count
    }
    
    func getCharacters() {
        networking.request(url: RickAndMortyAPI.characters) { result in
            switch result {
            case .success(let characters):
                self.characters.value = characters
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
