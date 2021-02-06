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
        viewModel.getValues()
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
        
        viewModel.name.bind { [weak self] name in
            guard let self = self else { return }
            self.detailView.nameLabel.text = name
        }
        
        viewModel.status.bind { [weak self] status in
            guard let self = self else { return }
            self.detailView.statusLabel.text = status
        }
        
        viewModel.species.bind { [weak self] species in
            guard let self = self else { return }
            self.detailView.speciesLabel.text = species
        }
        
        viewModel.gender.bind { [weak self] gender in
            guard let self = self else { return }
            self.detailView.genderLabel.text = gender
        }
        
        viewModel.originName.bind { [weak self] originName in
            guard let self = self else { return }
            self.detailView.originLabel.text = originName
        }
        
        viewModel.locationName.bind { [weak self] locationName in
            guard let self = self else { return }
            self.detailView.locationLabel.text = locationName
        }
        
        viewModel.episodes.bind { [weak self] episodes in
            guard let self = self else { return }
            self.detailView.episodeLabel.text = episodes
        }
    }
    
    deinit {
        assert(true, "deinit DetailViewController")
    }

}
