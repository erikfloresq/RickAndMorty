//
//  RickAndMortyUITests.swift
//  RickAndMortyUITests
//
//  Created by Erik Flores on 27/01/21.
//

import XCTest

class RickAndMortyUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testScroll() throws {
        let app = XCUIApplication()
        app.launch()
        app.swipeUp()
        app.swipeUp()
    }
    
    func testDetail() throws {
        let app = XCUIApplication()
        app.launch()
        let myTable = app.tables.matching(identifier: "CharactersTableView")
        let cell0 = myTable.cells.element(matching: .cell, identifier: "CharacterTableViewCell_0")
        cell0.tap()
        app.swipeDown()
        
        let cell1 = myTable.cells.element(matching: .cell, identifier: "CharacterTableViewCell_1")
        cell1.tap()
        app.swipeDown()
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
