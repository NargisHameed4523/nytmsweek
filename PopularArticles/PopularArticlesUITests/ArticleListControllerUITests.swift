//
//  ArticleListControllerUITests.swift
//  PopularArticlesUITests
//
//  Created by nargis hameed on 29/07/2024.
//

import XCTest

class ArticleListControllerTests: XCTestCase {

    var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    
    func testTableViewDisplaysData() {
        let tableView = app.tables["tableView"]
        let firstCell = tableView.cells.element(boundBy: 0)
        let headingLabel = firstCell.staticTexts["heading"]
        let descpLabel = firstCell.staticTexts["descp"]
        let timeLabel = firstCell.staticTexts["timelb"]

        // Assume that the data has been loaded and verify that the first cell is configured correctly
        XCTAssertTrue(firstCell.exists, "First cell should exist")
        XCTAssertTrue(headingLabel.exists, "Heading label should exist")
        XCTAssertTrue(descpLabel.exists, "Description label should exist")
        XCTAssertTrue(timeLabel.exists, "Time label should exist")
    }
    
}
