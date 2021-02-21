//
//  MainViewControllerTests.swift
//  RickAndMortyTests
//
//  Created by Erik Flores on 15/02/21.
//

import XCTest
import Combine
@testable import RickAndMorty

class MainViewControllerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testDecoder() {
        let mainVC = MainViewController(coder: NSCoder())
        XCTAssertNil(mainVC)
    }

    func testDidSelected() throws {
        var cancellable = Set<AnyCancellable>()
        let networkingMock = NetworkingMock(okStatus: true)
        let mainViewModel = MainViewModel(networking: networkingMock)
        mainViewModel.getCharacters()
        let collectionViewDelegate = CharactersCollectionViewDelegate(viewModel: mainViewModel)
        let collectionView = CharactersCollectionView()
        collectionViewDelegate.selectAction.sink { character in
            XCTAssertEqual(character, mainViewModel.characters.value[1])
        }.store(in: &cancellable)
        collectionViewDelegate.collectionView(collectionView, didSelectItemAt: IndexPath(row: 1, section: 0))
    }
    
    func testCharacterContentView() {
        let contentView = CharacterContentView(coder: NSCoder())
        XCTAssertNil(contentView)
    }

    func testPerformanceExample() throws {
        self.measure {
            
        }
    }

}
