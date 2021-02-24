//
//  CharacterCellViewModel.swift
//  RickAndMorty
//
//  Created by Erik Flores on 23/02/21.
//

import SwiftUI
import Combine

class CharacterCellViewModel: ObservableObject {
    @Published var photoData: Data?
    var networking: NetworkingProtocol
    var cancellable = Set<AnyCancellable>()
    
    init(networking: NetworkingProtocol = Networking()) {
        self.networking = networking
    }
    
    func setPhoto(from url: String) {
        let queue = DispatchQueue(label: "dev.erikflores.cellPhoto", attributes: .concurrent)
        queue.async { [weak self] in
            guard let self = self else { return }
            self.networking.simpleRequest(url: url)
                .receive(on: RunLoop.main)
                .sink { completion in
                    switch completion {
                    case .failure:
                        self.photoData = Data()
                    case .finished:
                        break
                    }
            } receiveValue: { data in
                self.photoData = data
            }.store(in: &self.cancellable)
        }
    }
}
