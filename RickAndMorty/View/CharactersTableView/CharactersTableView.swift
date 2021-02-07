//
//  CharactersTableView.swift
//  RickAndMorty
//
//  Created by Erik Flores on 27/01/21.
//

import UIKit

class CharactersTableView: UITableView {

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func loadFromNib() -> CharactersTableView {
        let nib = UINib(nibName: "CharactersTableView", bundle: nil)
        let view = nib.instantiate(withOwner: self, options: nil).first as! CharactersTableView
        return view
    }
    
    private func setup() {
        registerCell()
        accessibilityIdentifier = "CharactersTableView"
    }
    
    private func registerCell() {
        let cellNib = UINib(nibName: "CharacterTableViewCell", bundle: nil)
        register(cellNib, forCellReuseIdentifier: "CharacterTableViewCell")
    }
    
}
