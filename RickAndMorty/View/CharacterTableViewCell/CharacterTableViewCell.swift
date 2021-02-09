//
//  CharacterTableViewCell.swift
//  RickAndMorty
//
//  Created by Erik Flores on 27/01/21.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setup() {
        accessoryType = .disclosureIndicator
    }

}
