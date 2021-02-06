//
//  DetailView.swift
//  RickAndMorty
//
//  Created by Erik Flores on 1/02/21.
//

import UIKit

class DetailView: UIView {

    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var originLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var episodeLabel: UILabel!
    
    func loadFromNib() -> DetailView {
        let nib = UINib(nibName: "DetailView", bundle: nil)
        let view = nib.instantiate(withOwner: self, options: nil).first as! DetailView
        return view
    }
    
}
