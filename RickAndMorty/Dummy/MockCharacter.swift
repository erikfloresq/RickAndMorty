//
//  MockCharacter.swift
//  RickAndMorty
//
//  Created by Erik Flores on 27/02/21.
//

import Foundation

struct MockCharacter {
    
    static func getCharacter() -> Character? {
        let bundleUrl = Bundle.main.url(forResource: "character", withExtension: "json")
        guard let url = bundleUrl else {
            return nil
        }
        guard let data = try? Data(contentsOf: url) else {
            return nil
        }
        guard let character = try? JSONDecoder().decode(Character.self, from: data) else {
            return nil
        }
        return character
        
    }
}
