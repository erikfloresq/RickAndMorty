//
//  RickAndMortyTests.swift
//  RickAndMortyTests
//
//  Created by Erik Flores on 27/01/21.
//

import XCTest
import Combine
@testable import RickAndMorty

class RickAndMortyTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCharactersCount() throws {
        let networkingMock = NetworkingMock(okStatus: true)
        let mainViewModel = MainViewModel(networking: networkingMock)
        mainViewModel.getCharacters()
        
        XCTAssertEqual(mainViewModel.characters.value.count, 20)
    }
    
    func testCharactersCountEmpty() throws {
        let networkingMock = NetworkingMock(okStatus: false)
        let mainViewModel = MainViewModel(networking: networkingMock)
        mainViewModel.getCharacters()
        
        XCTAssertEqual(mainViewModel.characters.value.count, 0)
    }
    
    func testDidSelected() throws {
        var cancellable = Set<AnyCancellable>()
        let networkingMock = NetworkingMock(okStatus: true)
        let mainViewModel = MainViewModel(networking: networkingMock)
        mainViewModel.getCharacters()
        let tableViewDelegate = CharactersTableViewDelegate(viewModel: mainViewModel)
        let tableView = CharactersTableView()
        tableViewDelegate.selectAction.sink { character in
            XCTAssertEqual(character, mainViewModel.characters.value[1])
        }.store(in: &cancellable)
        tableViewDelegate.tableView(tableView, didSelectRowAt: IndexPath(row: 1, section: 0))
    }
    
    func testDetailSetData() throws {
        let networkingMock = NetworkingMock(okStatus: true)
        let mainViewModel = MainViewModel(networking: networkingMock)
        mainViewModel.getCharacters()
        let character = try XCTUnwrap(mainViewModel.characters.value.first, "Character nil")
        let detailViewModel = DetailViewModel(character: character, networking: networkingMock)
        
        XCTAssertEqual(detailViewModel.character, character)
    }
    
    func testDetailViewController() throws {
        let networkingMock = NetworkingMock(okStatus: true)
        let mainViewModel = MainViewModel(networking: networkingMock)
        mainViewModel.getCharacters()
        let character = try XCTUnwrap(mainViewModel.characters.value.first, "Character nil")
        let detailViewModel = DetailViewModel(character: character, networking: networkingMock)
        
        let detailViewController = DetailViewController(viewModel: detailViewModel)
        detailViewController.loadView()
        detailViewController.viewDidLoad()
        let detailView = detailViewController.detailView
        
        //XCTAssertEqual(detailView.heroImage.image, character.image)
        XCTAssertEqual(detailView.nameLabel.text, character.name)
        XCTAssertEqual(detailView.statusLabel.text, character.status)
        XCTAssertEqual(detailView.speciesLabel.text, character.species)
        XCTAssertEqual(detailView.genderLabel.text, character.gender)
        XCTAssertEqual(detailView.originLabel.text, character.origin.name)
        XCTAssertEqual(detailView.locationLabel.text, character.location.name)
    }

    func testPerformanceCharacterCount() throws {
        self.measure {
            let networkingMock = NetworkingMock(okStatus: false)
            let mainViewModel = MainViewModel(networking: networkingMock)
            mainViewModel.getCharacters()
        }
    }

}
