//
//  ResponseCharacter.swift
//  RickAndMorty
//
//  Created by Erik Flores on 27/01/21.
//

import Foundation

struct ResponseCharacter: Codable {
    let info: ResponseInfo
    let results: [Character]
}
