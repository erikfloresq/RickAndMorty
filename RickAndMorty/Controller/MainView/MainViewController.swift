//
//  MainViewController.swift
//  RickAndMorty
//
//  Created by Erik Flores on 27/01/21.
//

import UIKit
import Combine

class MainViewController: UIViewController {
    let viewModel: MainViewModelable
    let characterTableView = CharactersTableView()
    lazy var characterDataSource = CharactersTableViewDataSource(tableView: characterTableView)
    lazy var characterDelegate = CharactersTableViewDelegate(viewModel: viewModel, navigation: navigationController)
    lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }()
    var cancellable = Set<AnyCancellable>()
    
    init(viewModel: MainViewModelable) {
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
        characterTableView.dataSource = characterDataSource.dataSource
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
        viewModel.characters.sink { completion in
            switch completion {
            case .failure(let error):
                print(error)
            case .finished:
                print("finished")
            }
        } receiveValue: { characters in
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.activityIndicator.stopAnimating()
                self.characterDataSource.update(with: characters)
            }
        }.store(in: &cancellable)

    }
    
    deinit {
        print("deinit MainViewController")
    }

}

