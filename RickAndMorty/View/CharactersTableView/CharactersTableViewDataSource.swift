//
//  CharactersTableViewDataSource.swift
//  RickAndMorty
//
//  Created by Erik Flores on 28/01/21.
//

import UIKit

class CharactersTableViewDataSource {
    enum Sections: CaseIterable {
        case characters
    }
    var tableView: UITableView
    var dataSource: UITableViewDiffableDataSource<Sections, Character>!
    
    init(tableView: UITableView) {
        self.tableView = tableView
        dataSource = UITableViewDiffableDataSource<Sections, Character>(tableView: tableView,
                                                   cellProvider: { (tableView, indexPath, character) -> UITableViewCell? in
                        let dequeueCell = tableView.dequeueReusableCell(withIdentifier: "CharacterTableViewCell", for: indexPath) as! CharacterTableViewCell
                                                                return dequeueCell
        })
    }
    
//    func makeDataSource() ->  {
//        return UITableViewDiffableDataSource(tableView: tableView) { (tableView, indexPath, character) -> UITableViewCell? in
//            let dequeueCell = tableView.dequeueReusableCell(withIdentifier: "CharacterTableViewCell", for: indexPath) as! CharacterTableViewCell
//            return dequeueCell
//        }
//    }
    
    func update(with list:[Character]) {
        var snapshot = NSDiffableDataSourceSnapshot<Sections, Character>()
        snapshot.appendSections(Sections.allCases)
        snapshot.appendItems(list, toSection: .characters)
        dataSource.apply(snapshot)
    }
    
}

//class CharactersTableViewDataSource: NSObject, UITableViewDataSource {
//    let viewModel: MainViewModelable
//
//    init(viewModel: MainViewModelable) {
//        self.viewModel = viewModel
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return viewModel.charactersCount()
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let dequeueCell = tableView.dequeueReusableCell(withIdentifier: "CharacterTableViewCell", for: indexPath)
//        guard let cell = dequeueCell as? CharacterTableViewCell else {
//            return UITableViewCell()
//        }
//        cell.accessibilityIdentifier = "CharacterTableViewCell_\(indexPath.row)"
//        cell.configure(photoUrl: viewModel.characters.value[indexPath.row].image,
//                      name: viewModel.characters.value[indexPath.row].name)
//        return cell
//    }
//}
