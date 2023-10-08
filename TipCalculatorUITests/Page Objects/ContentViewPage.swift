//
//  ContentViewPage.swift
//  TipCalculatorUITests
//
//  Created by Pratiksha on 08/10/23.
//

import Foundation
import XCTest

class ContentViewPage {
    var app: XCUIApplication
    
    init(app: XCUIApplication!) {
        self.app = app
    }
    
    var totalTextField : XCUIElement {
        self.app.textFields["totalTextField"]
    }
    
    var calculateTipButton : XCUIElement {
        self.app.buttons["calculateTipButton"]
    }
    
    var tipPercentageSegmentedControl : XCUIElement {
        self.app.segmentedControls["tipPercentageSegmentedControl"]
    }
    
    var tipText : XCUIElement {
        self.app.staticTexts["tipText"]
    }
    
    var messageText : XCUIElement {
        self.app.staticTexts["messageText"]
    }
}
