//
//  Mocks.swift
//  RickAndMortyTests
//
//  Created by Erik Flores on 2/02/21.
//

import Foundation
@testable import RickAndMorty

fileprivate class BundleTargetingClass {}

struct Mocks {
    static func readJSON<T: Codable>(name: String) -> T? {
        guard let jsonPath = Bundle(for: BundleTargetingClass.self).url(forResource: name, withExtension: "json") else {
            return nil
        }
        do {
            let data = try Data(contentsOf: jsonPath)
            let json = try JSONDecoder().decode(T.self, from: data)
            return json
        } catch(let error) {
            print("Error \(error)")
            return nil
        }
    }
}
