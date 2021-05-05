//
//  Process_ManagerUITests.swift
//  Process ManagerUITests
//
//  Created by Hassan on 3.5.2021.
//

import XCTest

class Process_ManagerUITests: XCTestCase {

    //MARK:- Variables
    var app: XCUIApplication!
    var arrApplication: [NSRunningApplication]!
    
    //MARK:- UI TestCases
    func testLabelName() {
        //getting all the running process
        getRunningPrcoess()
        app = XCUIApplication()
        app.launch()
        for item in arrApplication {
            XCTAssert(app.staticTexts["Name: \(item.localizedName ?? "")"].exists)
        }
    }
    func testLabelId() {
        //getting all the running process
        getRunningPrcoess()
        app = XCUIApplication()
        app.launch()
        for item in arrApplication {
            XCTAssert(app.staticTexts["ID: \(item.bundleIdentifier ?? "N/A")"].exists)
        }
    }
  
    //MAKR:- Functions
    func getRunningPrcoess() {
        // Get all running applications
        let workspace = NSWorkspace.shared
        arrApplication = workspace.runningApplications
    }
}
