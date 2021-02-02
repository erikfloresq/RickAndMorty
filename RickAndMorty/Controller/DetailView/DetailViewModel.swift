//
//  DetailViewModel.swift
//  RickAndMorty
//
//  Created by Erik Flores on 2/02/21.
//

import Foundation

protocol DetailViewModelProtocol {
    func getPhoto()
    var image: String { get set }
    var heroImageData: Observable<Data?> { get set }
}

class DetailViewModel: DetailViewModelProtocol  {
    var image: String
    var heroImageData: Observable<Data?> = Observable(nil)
    let networking: NetworkingProtocol
    
    init(image: String, networking: NetworkingProtocol = Networking()) {
        self.image = image
        self.networking = networking
    }
    
    func getPhoto() {
        networking.simpleRequest(url: image) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                self.heroImageData.value = data
            case .failure(let error):
                print("error \(error)")
            }
        }
    }
    
}
