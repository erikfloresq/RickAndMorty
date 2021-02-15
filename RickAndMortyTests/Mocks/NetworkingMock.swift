//
//  NetworkingMock.swift
//  RickAndMortyTests
//
//  Created by Erik Flores on 2/02/21.
//

import Foundation
import UIKit
import Combine
@testable import RickAndMorty

class NetworkingMock: NetworkingProtocol {
    enum NetworkingMockError: Error {
        case noData
    }
    let okStatus: Bool
    
    init(okStatus: Bool) {
        self.okStatus = okStatus
    }
    
    func request(url: String) -> AnyPublisher<[Character], NetworkingError> {
        let mockPublisher = CurrentValueSubject<[Character], NetworkingError>([])
        var mock: ResponseCharacter?
        if okStatus {
            mock = Mocks.readJSON(name: "characters")
        }
        guard let characters = mock?.results else {
            mockPublisher.send(completion: .failure(.data))
            return mockPublisher.eraseToAnyPublisher()
        }
        mockPublisher.send(characters)
        return mockPublisher.eraseToAnyPublisher()
    }
    
    func simpleRequest(url: String) -> AnyPublisher<Data, NetworkingError> {
        let mockPublisher = CurrentValueSubject<Data, NetworkingError>(Data())
        if okStatus {
            mockPublisher.send(completion: .failure(NetworkingError.data))
        }
        let image = UIImage(named: "mockImage")
        guard let data = image?.cgImage?.dataProvider?.data as Data? else {
            mockPublisher.send(completion: .failure(NetworkingError.data))
            return mockPublisher.eraseToAnyPublisher()
        }
        mockPublisher.send(data)
        return mockPublisher.eraseToAnyPublisher()
    }
}
