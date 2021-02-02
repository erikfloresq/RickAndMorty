//
//  DetailViewController.swift
//  RickAndMorty
//
//  Created by Erik Flores on 27/01/21.
//

import UIKit

class DetailViewController: UIViewController {
    let detailView = DetailView().loadFromNib()
    let viewModel: DetailViewModelProtocol
    
    init(viewModel: DetailViewModelProtocol) {
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
    }
    
    
    
    deinit {
        print("deinit DetailViewController")
    }

}
