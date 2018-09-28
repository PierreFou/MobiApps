//
//  MobiAppsTests.swift
//  MobiAppsTests
//
//  Created by Pierre on 25/09/2018.
//  Copyright © 2018 Pierre. All rights reserved.
//

import XCTest
@testable import MobiApps

class MobiAppsTests: XCTestCase {

    func testDate() {
        let timeStamp: Double = 1538092800.0
        let dateString = timeStamp.getDate(withFormat: Constants.Date.DateFormat)
        
        XCTAssertEqual(dateString, "02H, Vendredi 28 Septembre")
    }

}
