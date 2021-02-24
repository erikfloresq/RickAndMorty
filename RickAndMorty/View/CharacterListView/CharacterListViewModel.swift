//
//  CharacterListViewModel.swift
//  RickAndMorty
//
//  Created by Erik Flores on 23/02/21.
//

import Foundation
import Combine

enum CharacterViewModelError: Error {
    case request
}

protocol CharacterViewModelable {
    //var characters: CurrentValueSubject<[Character], MainViewModelError> { get set }
    var characters: [Character] { get set }
    func getCharacters()
}

class CharacterListViewModel: ObservableObject ,CharacterViewModelable {
    private let networking: NetworkingProtocol
    @Published var characters: [Character] = []
    var cancellable = Set<AnyCancellable>()
    
    init(networking: NetworkingProtocol = Networking()) {
        self.networking = networking
    }
    
    func getCharacters() {
        networking.request(url: RickAndMortyAPI.characters)
            .receive(on: RunLoop.main)
            .sink { completion in
                switch completion {
                case .failure:
                    self.characters = []
                case .finished:
                    break
                }
            } receiveValue: { (characters) in
                self.characters = characters
            }.store(in: &cancellable)
    }
    
    
}
