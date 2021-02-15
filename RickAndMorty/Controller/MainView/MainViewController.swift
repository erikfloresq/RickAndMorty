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
    lazy var characterDelegate = CharactersTableViewDelegate(viewModel: viewModel)
    lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }()
    var cancellable = Set<AnyCancellable>()
    var tableViewAction = PassthroughSubject<Character, Never>()
    
    init(viewModel: MainViewModelable) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        return nil
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
        bindData()
        bindActions()
    }
    
    func addActivity() {
        view.addSubview(activityIndicator)
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.topAnchor.constraint(equalTo: view.topAnchor, constant: 50)
        ])
    }
    
    func bindData() {
        activityIndicator.startAnimating()
        viewModel.characters
            .receive(on: RunLoop.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print(error)
                case .finished:
                    break
                }
            } receiveValue: { characters in
                self.activityIndicator.stopAnimating()
                self.characterDataSource.update(with: characters)
            }.store(in: &cancellable)
    }
    
    func bindActions() {
        characterDelegate.selectAction.sink { character in
            let detailViewModel = DetailViewModel(character: character)
            let detailViewController = DetailViewController(viewModel: detailViewModel)
            self.navigationController?.showDetailViewController(detailViewController, sender: nil)
        }.store(in: &cancellable)
    }

}

