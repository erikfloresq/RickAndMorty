//
//  NetworkingMock.swift
//  RickAndMortyTests
//
//  Created by Erik Flores on 2/02/21.
//

import Foundation
import UIKit
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
        if okStatus {
            completionHandler(.failure(NetworkingMockError.noData))
            return
        }
        let image = UIImage(named: "mockImage")
        guard let data = image?.cgImage?.dataProvider?.data as Data? else {
            completionHandler(.failure(NetworkingMockError.noData))
            return
        }
        completionHandler(.success(data))
    }
}
