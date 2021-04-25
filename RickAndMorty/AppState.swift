//
//  AppState.swift
//  RickAndMorty
//
//  Created by Erik Flores on 25/4/21.
//

import Foundation

class AppState: ObservableObject {
    @Published var tabSelected: MainViewTab = .characters
}
