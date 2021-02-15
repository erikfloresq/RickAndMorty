//
//  Alert.swift
//  RickAndMorty
//
//  Created by Erik Flores on 15/02/21.
//

import Foundation
import UIKit

class Alert {
    let context: UIViewController
    
    init(context: UIViewController) {
        self.context = context
    }
    
    func show(message: String) {
        let messageController = UIAlertController(title: "R&M",
                                                message: message,
                                                preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel)
        messageController.addAction(okAction)
        context.show(messageController, sender: nil)
    }
}
