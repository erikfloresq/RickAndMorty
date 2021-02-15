//
//  DetailViewController.swift
//  RickAndMorty
//
//  Created by Erik Flores on 27/01/21.
//

import UIKit
import Combine

class DetailViewController: UIViewController {
    let detailView = DetailView().loadFromNib()
    let viewModel: DetailViewModelable
    var cancellable = Set<AnyCancellable>()
    
    init(viewModel: DetailViewModelable) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        return nil
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
        viewModel
            .heroImageData
            .receive(on: RunLoop.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print(error)
                case .finished:
                    print("finished")
                }
            } receiveValue: { heroImageData in
                self.detailView.heroImage.image = UIImage(data: heroImageData)
            }.store(in: &cancellable)

        let character = viewModel.character
        self.detailView.nameLabel.text = character.name
        self.detailView.statusLabel.text = character.status
        self.detailView.speciesLabel.text = character.species
        self.detailView.genderLabel.text = character.gender
        self.detailView.originLabel.text = character.origin.name
        self.detailView.locationLabel.text = character.location.name
        self.detailView.episodeLabel.text = String(character.episode.count)
    }
    
    deinit {
        print("deinit DetailViewController")
    }

}
