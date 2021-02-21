//
//  CharactersCollectionViewDataSource.swift
//  RickAndMorty
//
//  Created by Erik Flores on 20/02/21.
//

import UIKit

class CharacterCollectionViewDataSource {
    typealias DataSource = UICollectionViewDiffableDataSource<Sections, Character>
    typealias ListCell = UICollectionView.CellRegistration<CharacterCollectionViewCell, Character>
    typealias CellProvider = (UICollectionView, IndexPath, Character) -> UICollectionViewCell?
    
    enum Sections: CaseIterable {
        case characters
    }
    
    
    let collectionView: UICollectionView
    var dataSource: DataSource!
    
    init(collectionView: UICollectionView) {
        self.collectionView = collectionView
        makeDataSource()
    }
    
    func registerCell() -> ListCell {
        let cell = ListCell { (collectionViewCell, indexPath, character) in
            var contentConfig = CharacterContentConfiguration()
            contentConfig.name = character.name
            contentConfig.url = character.image
            collectionViewCell.contentConfiguration = contentConfig
            collectionViewCell.accessories = [.disclosureIndicator()]
            collectionViewCell.accessibilityIdentifier = "CharacterCollectionViewCell_\(indexPath.row)"
        }
        return cell
    }
    
    func makeDataSource() {
        let cellProvider: CellProvider = { (collectionView, indexPath, character) in
            let cell = collectionView.dequeueConfiguredReusableCell(using: self.registerCell(), for: indexPath, item: character)
            return cell
        }
        dataSource = DataSource(collectionView: collectionView, cellProvider: cellProvider)
    }
    
    func update(with list:[Character]) {
        var snapshot = NSDiffableDataSourceSnapshot<Sections, Character>()
        snapshot.appendSections([Sections.characters])
        snapshot.appendItems(list)
        dataSource.apply(snapshot)
    }
    
    
}
