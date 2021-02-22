//
//  UIScreen.swift
//  RickAndMorty
//
//  Created by Erik Flores on 22/02/21.
//

import UIKit

extension UIScreen {
    static var isIpad: Bool {
        let horizontal = UIScreen.main.traitCollection.horizontalSizeClass
        let vertical = UIScreen.main.traitCollection.verticalSizeClass
        if horizontal == .regular && vertical == .regular {
            return true
        } else {
            return false
        }
    }
}
