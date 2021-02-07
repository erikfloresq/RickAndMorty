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

    func testPerformanceExample() throws {
        self.measure {
            
        }
    }

}
