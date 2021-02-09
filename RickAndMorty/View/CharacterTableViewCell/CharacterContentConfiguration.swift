//
//  CharacterContentConfiguration.swift
//  RickAndMorty
//
//  Created by Erik Flores on 9/02/21.
//

import UIKit

struct CharacterContentConfiguration: UIContentConfiguration {
    var name = ""
    var url: String = ""
    
    func makeContentView() -> UIView & UIContentView {
        return CharacterContentView(self)
    }
    
    func updated(for state: UIConfigurationState) -> CharacterContentConfiguration {
        return self
    }
}
