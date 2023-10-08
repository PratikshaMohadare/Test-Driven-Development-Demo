//
//  TipCalculator.swift
//  TipCalculator
//
//  Created by Pratiksha on 04/10/23.
//

import Foundation

enum TipCalculatorError : Error {
    case invalidInput
}

class TipCalculator {
    
    func calculateTip(total: Double, tipPercentage: Double) throws -> Double {
        if total < 0 {
            throw TipCalculatorError.invalidInput
        }
        return total * tipPercentage
    }
}
