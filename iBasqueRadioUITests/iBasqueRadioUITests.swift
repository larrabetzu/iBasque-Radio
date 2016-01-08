//
//  iBasqueRadioUITests.swift
//  iBasqueRadioUITests
//
//  Created by Gorka Ercilla on 2016/01/07.
//  Copyright © 2016 Gorka Ercilla. All rights reserved.
//

import XCTest

class iBasqueRadioUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        let app = XCUIApplication()
        setupSnapshot(app)
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testTakeScreenshots() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let app = XCUIApplication()
        
        snapshot("home")
        app.navigationBars["iBasque Radio"].buttons["icon hamburger"].tap()
        snapshot("webgunea", waitForLoadingIndicator: true)
        app.buttons["btn close"].tap()
        app.tables.staticTexts["97 irratia"].tap()
        snapshot("irratia", waitForLoadingIndicator: true)
        app.buttons["logo"].tap()
        snapshot("deskribapena")
        let okayButton = app.buttons["Okay"]
        okayButton.tap()
        app.buttons["More Info"].tap()
        snapshot("irratiaInfo")
        okayButton.tap()
        
    }
    
}
