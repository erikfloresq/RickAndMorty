//
//  DetailView.swift
//  RickAndMorty
//
//  Created by Erik Flores on 1/02/21.
//

import UIKit

class DetailView: UIView {

    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    func loadFromNib() -> DetailView {
        let nib = UINib(nibName: "DetailView", bundle: nil)
        let view = nib.instantiate(withOwner: self, options: nil).first as! DetailView
        return view
    }
    
}
