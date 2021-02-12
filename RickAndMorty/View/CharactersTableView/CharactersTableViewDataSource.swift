//
//  CharactersTableViewDataSource.swift
//  RickAndMorty
//
//  Created by Erik Flores on 28/01/21.
//

import UIKit

class CharactersTableViewDataSource {
    typealias CellProvider = (UITableView, IndexPath, Character) -> UITableViewCell?
    enum Sections: CaseIterable {
        case characters
    }
    var tableView: UITableView
    var dataSource: UITableViewDiffableDataSource<Sections, Character>!
    
    init(tableView: UITableView) {
        self.tableView = tableView
        let cellProvider: CellProvider = { tableView, indexPath, character in
            let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterTableViewCell",
                                                 for: indexPath)
            var contentConfig = CharacterContentConfiguration()
            contentConfig.name = character.name
            contentConfig.url = character.image
            cell.contentConfiguration = contentConfig
            cell.accessibilityIdentifier = "CharacterTableViewCell_\(indexPath.row)"
            return cell
        }
        dataSource = UITableViewDiffableDataSource(tableView: tableView,
                                                   cellProvider: cellProvider)
    }
    
    func update(with list:[Character]) {
        var snapshot = NSDiffableDataSourceSnapshot<Sections, Character>()
        snapshot.appendSections(Sections.allCases)
        snapshot.appendItems(list, toSection: .characters)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
    
}
