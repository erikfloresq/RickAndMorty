//
//  MainViewModel.swift
//  RickAndMorty
//
//  Created by Erik Flores on 30/01/21.
//

import Foundation
import Combine

enum MainViewModelError: Error {
    case request
}

protocol MainViewModelable {
    var characters: CurrentValueSubject<[Character], MainViewModelError> { get set }
    func getCharacters()
}

class MainViewModel: MainViewModelable {
    private let networking: NetworkingProtocol
    var characters = CurrentValueSubject<[Character], MainViewModelError>([])
    var cancellable = Set<AnyCancellable>()
    
    init(networking: NetworkingProtocol) {
        self.networking = networking
    }
    
    func getCharacters() {
        networking.request(url: RickAndMortyAPI.characters)
            .sink { completion in
                switch completion {
                case .failure:
                    self.characters.send(completion: .failure(.request))
                case .finished:
                    self.characters.send(completion: .finished)
                }
            } receiveValue: { (characters) in
                self.characters.send(characters)
            }.store(in: &cancellable)
    }
    
    deinit {
        print("deinit MainViewModel")
    }
}
