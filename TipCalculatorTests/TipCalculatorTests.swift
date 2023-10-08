//
//  TipCalculatorTests.swift
//  TipCalculatorTests
//
//  Created by Pratiksha on 04/10/23.
//

import XCTest

final class when_calculating_tip_based_on_total_amount: XCTestCase {

    func test_should_calculate_tip_successfully() {
        let tipCalculator = TipCalculator()
        let tip = try! tipCalculator.calculateTip(total: 100, tipPercentage: 0.1)
        XCTAssertEqual(tip, 10.0, "\(tip) is not equal to 10.0")
    }
}

class test_when_calculating_tip_based_on_negative_total_amount : XCTestCase {
    func test_should_throw_invalid_input() {
        let tipCalculator = TipCalculator()
        XCTAssertThrowsError(try tipCalculator.calculateTip(total: -100, tipPercentage: 0.1), "") {error in 
            XCTAssertEqual(error as! TipCalculatorError, TipCalculatorError.invalidInput)
        }
    }
}
