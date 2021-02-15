//
//  DetailViewControllerTests.swift
//  RickAndMortyTests
//
//  Created by Erik Flores on 15/02/21.
//

import XCTest
import Combine
@testable import RickAndMorty

class DetailViewControllerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testDecoder() {
        let detailVC = DetailViewController(coder: NSCoder())
        XCTAssertNil(detailVC)
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

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
