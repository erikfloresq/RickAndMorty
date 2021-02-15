//
//  MainViewModelTests.swift
//  RickAndMortyTests
//
//  Created by Erik Flores on 15/02/21.
//

import XCTest
import Combine
@testable import RickAndMorty

class MainViewModelTests: XCTestCase {

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

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
