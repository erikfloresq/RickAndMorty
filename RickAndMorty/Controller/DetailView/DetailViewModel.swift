//
//  DetailViewModel.swift
//  RickAndMorty
//
//  Created by Erik Flores on 2/02/21.
//

import Foundation
import Combine

enum DetailViewModelError: Error {
    case getPhoto
}

protocol DetailViewModelable {
    func getPhoto()
    var heroImageData: PassthroughSubject<Data, DetailViewModelError> { get set }
    var character: Character { get set }
}

class DetailViewModel: NSObject, DetailViewModelable  {
    let networking: NetworkingProtocol
    var heroImageData =  PassthroughSubject<Data, DetailViewModelError>()
    var cancellable = Set<AnyCancellable>()
    var character: Character
    
    init(character: Character, networking: NetworkingProtocol = Networking()) {
        self.character = character
        self.networking = networking
    }
    
    func getPhoto() {
        let imageURL = character.image
        networking.simpleRequest(url: imageURL)
            .sink { completion in
                switch completion {
                case .failure:
                    self.heroImageData.send(completion: .failure(.getPhoto))
                case .finished:
                    self.heroImageData.send(completion: .finished)
                }
            } receiveValue: { data in
                self.heroImageData.send(data)
            }.store(in: &cancellable)
    }
    
    deinit {
        print("deinit DetailViewModel")
    }
    
}
