//
//  RickAndMortyTests.swift
//  RickAndMortyTests
//
//  Created by Erik Flores on 27/01/21.
//

import XCTest
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
        
        XCTAssertEqual(mainViewModel.charactersCount(), 20)
    }
    
    func testCharactersCountEmpty() throws {
        let networkingMock = NetworkingMock(okStatus: false)
        let mainViewModel = MainViewModel(networking: networkingMock)
        mainViewModel.getCharacters()
        
        XCTAssertEqual(mainViewModel.charactersCount(), 0)
    }
    
    func testDetailSetData() throws {
        let networkingMock = NetworkingMock(okStatus: true)
        let mainViewModel = MainViewModel(networking: networkingMock)
        mainViewModel.getCharacters()
        let character = try XCTUnwrap(mainViewModel.characters.value.first, "Character nil")
        let detailViewModel = DetailViewModel(character: character, networking: networkingMock)
        detailViewModel.getValues()
        
        XCTAssertEqual(detailViewModel.name.value, character.name)
        XCTAssertEqual(detailViewModel.status.value, character.status)
        XCTAssertEqual(detailViewModel.species.value, character.species)
        XCTAssertEqual(detailViewModel.gender.value, character.gender)
        XCTAssertEqual(detailViewModel.originName.value, character.origin.name)
        XCTAssertEqual(detailViewModel.locationName.value, character.location.name)
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
