//
//  CharacterTableViewCell.swift
//  RickAndMorty
//
//  Created by Erik Flores on 27/01/21.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {
    
    @IBOutlet weak var photo: UIImageView! {
        didSet {
            photo.layer.cornerRadius = 10
            photo.clipsToBounds = true
        }
    }
    @IBOutlet weak var name: UILabel!
    
    static let identifier = "CharacterTableViewCell"
    
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
    
    override func updateConfiguration(using state: UICellConfigurationState) {
        super.updateConfiguration(using: state)
        var contentConfig = defaultContentConfiguration().updated(for: state)
        contentConfig.text = "demo"
        //contentConfig.image = UIImage(named: "")

        self.contentConfiguration = contentConfig
    }
    
    func configure(photoUrl: String, name: String) {
        setPhoto(from: photoUrl)
        self.name.text = name
    }
    
    func setPhoto(from url: String) {
        let networking = Networking()
        let queue = DispatchQueue(label: "dev.erikflores.cellPhoto", attributes: .concurrent)
        queue.async { [weak self] in
            guard let self = self else { return }
            networking.simpleRequest(url: url) { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .success(let data):
                    DispatchQueue.main.async {
                        self.photo.image = UIImage(data: data)
                    }
                case .failure:
                    print("asd")
                }
            }
        }
    }

}
