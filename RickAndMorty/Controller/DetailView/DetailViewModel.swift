//
//  DetailViewModel.swift
//  RickAndMorty
//
//  Created by Erik Flores on 2/02/21.
//

import Foundation

protocol DetailViewModelable {
    func getPhoto()
    func getValues()
    var character: Character { get set }
    var heroImageData: Observable<Data?> { get set }
    var name: Observable<String> { get set }
    var status: Observable<String> { get set }
    var species: Observable<String> { get set }
    var type: Observable<String> { get set }
    var gender: Observable<String> { get set }
    var originName: Observable<String> { get set }
    var locationName: Observable<String> { get set }
    var episodes: Observable<String> { get set }
}

class DetailViewModel: DetailViewModelable  {
    var name: Observable<String> = Observable("")
    var locationName: Observable<String> = Observable("")
    var episodes: Observable<String> = Observable("")
    var heroImageData: Observable<Data?> = Observable(nil)
    var status: Observable<String> = Observable("")
    var species: Observable<String> = Observable("")
    var type: Observable<String> = Observable("")
    var gender: Observable<String> = Observable("")
    var originName: Observable<String> = Observable("")
    var character: Character
    let networking: NetworkingProtocol
    
    init(character: Character, networking: NetworkingProtocol = Networking()) {
        self.character = character
        self.networking = networking
    }
    
    func getPhoto() {
        let imageURL = character.image
        networking.simpleRequest(url: imageURL) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                self.heroImageData.value = data
            case .failure(let error):
                print("error \(error)")
            }
        }
    }
    
    func getValues() {
        name.value = character.name
        status.value = character.status
        species.value = character.species
        type.value = character.type
        gender.value = character.gender
        originName.value = character.origin.name
        locationName.value = character.location.name
        episodes.value = ""
    }
    
    
    
    deinit {
        print("deinit DetailViewModel")
    }
    
}
