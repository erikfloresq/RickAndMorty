//
//  CharactersTableView.swift
//  RickAndMorty
//
//  Created by Erik Flores on 27/01/21.
//

import UIKit
import Combine

class CharactersTableView: UITableView {

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: .insetGrouped)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        registerCell()
        accessibilityIdentifier = "CharactersTableView"
    }
    
    private func registerCell() {
        register(CharacterTableViewCell.self, forCellReuseIdentifier: "CharacterTableViewCell")
    }
    
}
