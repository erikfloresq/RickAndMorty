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
    lazy var characterDataSource = CharactersTableViewDataSource(viewModel: viewModel)
    lazy var characterDelegate = CharactersTableViewDelegate(viewModel: viewModel, navigation: navigationController)
    lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }()
    
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
        characterTableView.dataSource = characterDataSource
        characterTableView.delegate = characterDelegate
        addActivity()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getCharacters()
        bindElements()
    }
    
    func addActivity() {
        view.addSubview(activityIndicator)
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.topAnchor.constraint(equalTo: view.topAnchor, constant: 50)
        ])
    }
    
    func bindElements() {
        activityIndicator.startAnimating()
        viewModel.characters.bind { [weak self] characters in
            guard let self = self else { return }
            DispatchQueue.main.async { [weak self] in
                self?.activityIndicator.stopAnimating()
                self?.characterTableView.reloadData()
            }
        }
    }
    
    deinit {
        print("deinit MainViewController")
    }

}

