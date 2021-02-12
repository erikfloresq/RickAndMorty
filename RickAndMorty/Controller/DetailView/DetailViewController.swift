//
//  DetailViewController.swift
//  RickAndMorty
//
//  Created by Erik Flores on 27/01/21.
//

import UIKit

class DetailViewController: UIViewController {
    let detailView = DetailView().loadFromNib()
    let viewModel: DetailViewModelable
    
    init(viewModel: DetailViewModelable) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .systemBackground
        view = detailView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getPhoto()
        bind()
    }
    
    func bind() {
        viewModel.heroImageData.bind { [weak self] heroImageData in
            guard let self = self else { return }
            DispatchQueue.main.async { [weak self] in
                guard let self = self,
                      let heroImageData = heroImageData else {
                    return
                }
                self.detailView.heroImage.image = UIImage(data: heroImageData)
            }
        }
        
        viewModel.character.bind { [weak self] character in
            guard let self = self, let character = character else { return }
            self.detailView.nameLabel.text = character.name
            self.detailView.statusLabel.text = character.status
            self.detailView.speciesLabel.text = character.species
            self.detailView.genderLabel.text = character.gender
            self.detailView.originLabel.text = character.origin.name
            self.detailView.locationLabel.text = character.location.name
            self.detailView.episodeLabel.text = String(character.episode.count)
        }
    }
    
    deinit {
        print("deinit DetailViewController")
    }

}
