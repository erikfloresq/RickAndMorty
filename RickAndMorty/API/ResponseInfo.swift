//
//  ResponseInfo.swift
//  RickAndMorty
//
//  Created by Erik Flores on 27/01/21.
//

import Foundation

struct ResponseInfo: Codable {
    let count: Int
    let pages: Int
    let next: String
    let prev: String?
}
