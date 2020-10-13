//
//  Int+.swift
//  TaskNumberOfCards
//
//  Created by Ivan Simunovic on 11/10/2020.
//

import Foundation

extension Int {
/// returns number of digits in Int number
    public var isAtleastThreeDigit: Bool {
        get {
            let number = numberOfDigits(in: self)
            
            if(number >= 3) {
                return true
            } else {
                return false
            }
        }
    }
}

private func numberOfDigits(in number: Int) -> Int {
    if number < 10 && number >= 0 {
        return 1
    } else {
        return 1 + numberOfDigits(in: number/10)
    }
}
