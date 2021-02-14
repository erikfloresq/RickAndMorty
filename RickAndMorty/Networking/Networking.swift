//
//  Networking.swift
//  RickAndMorty
//
//  Created by Erik Flores on 27/01/21.
//

import Foundation
import Combine

protocol NetworkingProtocol {
    func request(url: String) -> AnyPublisher<[Character], NetworkingError>
    func simpleRequest(url: String) -> AnyPublisher<Data, NetworkingError>
}

enum NetworkingError: Error {
    case makeURL
    case request
    case data
    case jsonDecoder
}

class Networking: NetworkingProtocol {
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
                    return NetworkingError.request
                }
                .eraseToAnyPublisher()
    }
    
    func simpleRequest(url: String) -> AnyPublisher<Data, NetworkingError> {
        guard let url = URL(string: url) else {
            return Fail<Data, NetworkingError>(error: NetworkingError.makeURL).eraseToAnyPublisher()
        }
        return session.dataTaskPublisher(for: url)
            .map { $0.data }
            .mapError { error in
                return NetworkingError.request
            }
            .eraseToAnyPublisher()
    }
}
