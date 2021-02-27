//
//  CharacterDetailViewModel.swift
//  RickAndMorty
//
//  Created by Erik Flores on 24/02/21.
//

import Combine
import SwiftUI

class CharacterDetailViewModel: ObservableObject {
    @Published var photoData: Data?
    let networking: NetworkingProtocol
    let character: Character
    var cancellable = Set<AnyCancellable>()
    
    init(character: Character, networking: NetworkingProtocol = Networking()) {
        self.character = character
        self.networking = networking
    }
    
    func getPhoto() {
        let imageURL = character.image
        networking.simpleRequest(url: imageURL)
            .receive(on: RunLoop.main)
            .sink { completion in
                switch completion {
                case .failure:
                    self.photoData = nil
                case .finished:
                    break
                }
            } receiveValue: { data in
                self.photoData = data
            }.store(in: &cancellable)
    }
}
