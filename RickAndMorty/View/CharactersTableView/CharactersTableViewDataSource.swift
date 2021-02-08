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
    
    func update(with list:[Character]) {
        var snapshot = NSDiffableDataSourceSnapshot<Sections, Character>()
        snapshot.appendSections(Sections.allCases)
        snapshot.appendItems(list, toSection: .characters)
        dataSource.apply(snapshot)
    }
    
}
