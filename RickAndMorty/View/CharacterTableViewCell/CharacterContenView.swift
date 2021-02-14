//
//  CharacterContenView.swift
//  RickAndMorty
//
//  Created by Erik Flores on 9/02/21.
//

import UIKit
import Combine

class CharacterContentView: UIView, UIContentView {
    lazy var photo: UIImageView = {
        let photo = UIImageView()
        photo.translatesAutoresizingMaskIntoConstraints = false
        photo.layer.cornerRadius = 5
        photo.clipsToBounds = true
        photo.contentMode = .scaleAspectFill
        return photo
    }()
    lazy var name: UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    lazy var stackContainer: UIStackView = {
        let stackContainer = UIStackView()
        stackContainer.translatesAutoresizingMaskIntoConstraints = false
        stackContainer.alignment = .center
        stackContainer.axis = .horizontal
        stackContainer.spacing = 10
        return stackContainer
    }()
    var configuration: UIContentConfiguration {
        get { appliedConfiguration }
        set {
            guard let newConfig = newValue as? CharacterContentConfiguration else { return }
            configure(configuration: newConfig)
        }
    }
    private var appliedConfiguration: CharacterContentConfiguration!
    var cancellable = Set<AnyCancellable>()
    
    init(_ configuration: CharacterContentConfiguration) {
        super.init(frame: .zero)
        addCustomView()
        configure(configuration: configuration)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeCustomView() -> UIStackView {
        stackContainer.addArrangedSubview(photo)
        stackContainer.addArrangedSubview(name)
        return stackContainer
    }
    
    func addCustomView() {
        let constainerStack = makeCustomView()
        addSubview(constainerStack)
        let constraints = [
            stackContainer.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            stackContainer.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            stackContainer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            stackContainer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            photo.widthAnchor.constraint(equalToConstant: 100),
            photo.heightAnchor.constraint(equalToConstant: 104)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func configure(configuration: CharacterContentConfiguration) {
        guard appliedConfiguration != configuration else {
            return
        }
        appliedConfiguration = configuration
        self.name.text = configuration.name
        setPhoto(from: configuration.url)
    }
    
    func setPhoto(from url: String) {
        let networking = Networking()
        let queue = DispatchQueue(label: "dev.erikflores.cellPhoto", attributes: .concurrent)
        queue.async { [weak self] in
            guard let self = self else { return }
            networking.simpleRequest(url: url).sink { completion in
                switch completion {
                case .failure:
                    print("")
                case .finished:
                    print("")
                }
            } receiveValue: { data in
                DispatchQueue.main.async {
                    self.photo.image = UIImage(data: data)
                }
            }.store(in: &self.cancellable)
        }
    }
}
