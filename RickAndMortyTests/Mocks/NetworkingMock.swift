//
//  NetworkingMock.swift
//  RickAndMortyTests
//
//  Created by Erik Flores on 2/02/21.
//

import Foundation
@testable import RickAndMorty

class NetworkingMock: NetworkingProtocol {
    enum NetworkingMockError: Error {
        case noData
    }
    let okStatus: Bool
    
    init(okStatus: Bool) {
        self.okStatus = okStatus
    }
    
    func request(url: String, completionHandler: @escaping (Result<[Character], Error>) -> Void) {
        var mock: ResponseCharacter?
        if okStatus {
            mock = Mocks.readJSON(name: "characters")
        }
        guard let characters = mock?.results else {
            completionHandler(.failure(NetworkingMockError.noData))
            return
        }
        completionHandler(.success(characters))
    }
    
    func simpleRequest(url: String, completionHandler: @escaping (Result<Data, Error>) -> Void) {
        
    }
}
