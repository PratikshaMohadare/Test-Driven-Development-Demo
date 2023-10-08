//
//  TipCalculatorUITests.swift
//  TipCalculatorUITests
//
//  Created by Pratiksha on 08/10/23.
//

import XCTest

final class when_content_view_is_shown: XCTestCase {
    
    private var app : XCUIApplication!
    private var contentViewPage : ContentViewPage!
    
    override func setUp() {
        app = XCUIApplication()
        contentViewPage = ContentViewPage(app: app)
        continueAfterFailure = false
        app.launch()
    }
    
    func test_should_make_sure_the_total_textfield_contains_default_value() {
        XCTAssertEqual(contentViewPage.totalTextField.value as! String, "Enter total")
    }
    
    func test_should_make_sure_20_percent_default_tip_option_is_selected() {
        let segmentControlButton = contentViewPage.tipPercentageSegmentedControl.buttons.element(boundBy: 1)
        XCTAssertEqual(segmentControlButton.label, "20%")
        XCTAssertTrue(segmentControlButton.isSelected)
    }
    
    override func tearDown() {
        //clean up
    }
}

class test_when_calculate_tip_button_is_pressed_for_valid_input : XCTestCase {
    private var app : XCUIApplication!
    private var contentViewPage : ContentViewPage!

    override func setUp() {
        app = XCUIApplication()
        contentViewPage = ContentViewPage(app: app)
        continueAfterFailure = false
        app.launch()
        
        let calculateTipButton = contentViewPage.calculateTipButton
        
        let totalTextField = contentViewPage.totalTextField
        totalTextField.tap()
        totalTextField.typeText("100")
        
        calculateTipButton.tap()
    }
    
    func test_should_make_sure_that_tip_is_displayed_on_the_screen() {
                
        let tipText = contentViewPage.tipText
        let _ = tipText.waitForExistence(timeout: 0.5)
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        let tip  = formatter.string(from: NSNumber(value: 20))
        
        XCTAssertEqual(tipText.label, tip)
    }
}

class test_when_calculate_tip_button_is_pressed_for_invalid_input : XCTestCase {
    private var app : XCUIApplication!
    private var contentViewPage : ContentViewPage!

    override func setUp() {
        app = XCUIApplication()
        contentViewPage = ContentViewPage(app: app)
        continueAfterFailure = false
        app.launch()
        
        let calculateTipButton = contentViewPage.calculateTipButton
        
        let totalTextField = contentViewPage.totalTextField
        totalTextField.tap()
        totalTextField.typeText("-100")
        
        calculateTipButton.tap()
    }
    
    func test_should_clear_tip_text_on_invalid_input() {
        
        let tipText = contentViewPage.tipText
        let _ = tipText.waitForExistence(timeout: 0.5)
        XCTAssertEqual(tipText.label, "")
    }
    
    func test_should_display_error_message_on_invalid_input() {
        
        let messagaText = contentViewPage.messageText
        let _ = messagaText.waitForExistence(timeout: 0.5)
        XCTAssertEqual(messagaText.label, "Invalid Input")
    }
}
