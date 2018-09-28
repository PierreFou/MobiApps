//
//  MobiAppsUITests.swift
//  MobiAppsUITests
//
//  Created by Pierre on 25/09/2018.
//  Copyright © 2018 Pierre. All rights reserved.
//

import XCTest

class MobiAppsUITests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    func testNavigation() {
        let app = XCUIApplication()
        let firstChild = app.tables.children(matching: .any).element(boundBy: 0)
        if firstChild.exists {
            firstChild.tap()
        }
        
        let backButton = app.navigationBars.buttons.element(boundBy: 0)
        backButton.tap()
        
        if firstChild.exists {
            firstChild.tap()
            backButton.tap()
        }
        
    }
    
    func testShare() {
        let app = XCUIApplication()
        let firstChild = app.tables.children(matching: .any).element(boundBy: 0)
        if firstChild.exists {
            firstChild.tap()
            app.scrollViews.otherElements.buttons["Partager"].tap()
        }
    }

}
