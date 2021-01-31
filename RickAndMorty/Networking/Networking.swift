//
//  Networking.swift
//  RickAndMorty
//
//  Created by Erik Flores on 27/01/21.
//

import Foundation
import Combine

protocol NetworkingProtocol {
    func request(url: String, completionHandler: @escaping (Result<[Character], Error>) -> Void)
}

enum NetworkingError: Error {
    case makeURL
    case request
    case data
    case jsonDecoder
}

class Networking: NetworkingProtocol {
    private let session = URLSession(configuration: .default)
    
    func request(url: String, completionHandler: @escaping (Result<[Character], Error>) -> Void) {
        guard let url = URL(string: url) else {
            completionHandler(.failure(NetworkingError.makeURL))
            return
        }
        session.dataTask(with: url) { data, _, error in
            guard error == nil else {
                completionHandler(.failure(NetworkingError.request))
                return
            }
            let decodeDataResult = Result { try self.decodeData(data: data) }
            switch decodeDataResult {
            case .success(let responseCharacter):
                completionHandler(.success(responseCharacter.results))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }.resume()
    }
    
    func decodeData(data: Data?) throws -> ResponseCharacter {
        guard let data = data else {
            throw NetworkingError.data
        }
        let jsonDecoderResult = Result { try JSONDecoder().decode(ResponseCharacter.self, from: data) }
        switch jsonDecoderResult {
        case .success(let responseCharacter):
            return responseCharacter
        case .failure:
            throw NetworkingError.jsonDecoder
        }
    }
    
    
//    func request(url: String) -> AnyPublisher<[Character], NetworkingError> {
//        guard let url = URL(string: url) else {
//            return Fail<[Character], NetworkingError>(error: NetworkingError.makeURL).eraseToAnyPublisher()
//        }
//        return session.dataTaskPublisher(for: url)
//                .map { $0.data }
//                .decode(type: ResponseCharacter.self, decoder: JSONDecoder())
//                .map{ $0.results }
//                .mapError { error in
//                    return NetworkingError.request
//                }
//                .eraseToAnyPublisher()
//    }
}
