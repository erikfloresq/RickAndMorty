//
//  MockNetworking.swift
//  RickAndMorty
//
//  Created by Erik Flores on 27/02/21.
//

import Foundation
import Combine
import UIKit

class MockNetworking: NetworkingProtocol {
    func request(url: String) -> AnyPublisher<[Character], NetworkingError> {
        let publisher = PassthroughSubject<[Character], NetworkingError>()
        let bundleUrl = Bundle.main.url(forResource: "character", withExtension: "json")
        guard let url = bundleUrl else {
            publisher.send(completion: .failure(NetworkingError.makeURL))
            return publisher.eraseToAnyPublisher()
        }
        guard let data = try? Data(contentsOf: url) else {
            publisher.send(completion: .failure(NetworkingError.data))
            return publisher.eraseToAnyPublisher()
        }
        guard let character = try? JSONDecoder().decode(Character.self, from: data) else {
            publisher.send(completion: .failure(NetworkingError.jsonDecoder))
            return publisher.eraseToAnyPublisher()
        }
        publisher.send([character])
        return publisher.eraseToAnyPublisher()
    }
    
    func simpleRequest(url: String) -> AnyPublisher<Data, NetworkingError> {
        let publisher = PassthroughSubject<Data, NetworkingError>()
        let image = UIImage(named: "mockImage")
        let data = image?.pngData()
        guard let dataImage = data else {
            publisher.send(completion: .failure(.data))
            return publisher.eraseToAnyPublisher()
        }
        publisher.send(dataImage)
        return publisher.eraseToAnyPublisher()
        
    }
}
