//
//  DetailViewModel.swift
//  RickAndMorty
//
//  Created by Erik Flores on 2/02/21.
//

import Foundation

protocol DetailViewModelable {
    func getPhoto()
    var character: Observable<Character?> { get set }
    var heroImageData: Observable<Data?> { get set }
}

class DetailViewModel: DetailViewModelable  {
    let networking: NetworkingProtocol
    var character: Observable<Character?> = Observable<Character?>(nil)
    var heroImageData: Observable<Data?> = Observable<Data?>(nil)
    //var cancellable: Set<AnyCancellable>()
    
    init(character: Character, networking: NetworkingProtocol = Networking()) {
        self.character.value = character
        self.networking = networking
    }
    
    func getPhoto() {
//        guard let imageURL = character.value?.image else {
//            return
//        }
//        networking.simpleRequest(url: imageURL) { [weak self] result in
//            guard let self = self else { return }
//            switch result {
//            case .success(let data):
//                self.heroImageData.value = data
//            case .failure:
//                self.heroImageData.value = nil
//            }
//        }
//        networking.simpleRequest(url: imageURL).sink { completion in
//            switch completion {
//            case .failure:
//                self.heroImageData
//            case .finished:
//                print("finished")
//            }
//        } receiveValue: { (<#Data#>) in
//            <#code#>
//        }
    }
    
    
    deinit {
        print("deinit DetailViewModel")
    }
    
}
