//
//  Character.swift
//  RickAndMorty
//
//  Created by Erik Flores on 27/01/21.
//

import Foundation

struct Character: Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: Origin
    let location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
    
    struct Origin: Codable {
        let name: String
        let url: String
    }
    struct Location: Codable {
        let name: String
        let url: String
    }
}
