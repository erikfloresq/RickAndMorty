//
//  MainViewController.swift
//  RickAndMorty
//
//  Created by Erik Flores on 27/01/21.
//

import UIKit
import Combine

class MainViewController: UIViewController {
    let viewModel: MainViewModelProtocol
    let characterTableView = CharactersTableView().loadFromNib()
    lazy var dataSource = CharactersTableViewDataSource(viewModel: viewModel)
    
    init(viewModel: MainViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        title = "Characters"
        view.backgroundColor = .systemBackground
        view = characterTableView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getCharacters()
        bindElements()
        
        characterTableView.dataSource = dataSource
    }
    
    func bindElements() {
        viewModel.characters.bind { [weak self] characters in
            guard let self = self else { return }
            DispatchQueue.main.async { [weak self] in
                self?.characterTableView.reloadData()
            }
        }
    }

}

