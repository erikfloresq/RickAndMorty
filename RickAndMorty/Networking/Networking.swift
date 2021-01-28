//
//  Networking.swift
//  RickAndMorty
//
//  Created by Erik Flores on 27/01/21.
//

import Foundation
import Combine

enum NetworkingError: Error {
    case makeURL
    case requestError
}

class Networking {
    private let session = URLSession(configuration: .default)
    
    func request(url: String) -> AnyPublisher<[Character], NetworkingError> {
        guard let url = URL(string: url) else {
            return Fail<[Character], NetworkingError>(error: NetworkingError.makeURL).eraseToAnyPublisher()
        }
        return session.dataTaskPublisher(for: url)
                .map { $0.data }
                .decode(type: ResponseCharacter.self, decoder: JSONDecoder())
                .map{ $0.results }
                .mapError { error in
                    return NetworkingError.requestError
                }
                .eraseToAnyPublisher()
    }
}
