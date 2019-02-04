//
//  UnitConverterPace.swift
//  WalkTracker
//
//  Created by 김민구 on 04/02/2019.
//  Copyright © 2019 김민구. All rights reserved.
//

import Foundation

class UnitConverterPace: UnitConverter {
    private let coefficient: Double
    
    init(coefficient: Double) {
        self.coefficient = coefficient
    }
    
    override func baseUnitValue(fromValue value: Double) -> Double {
        return self.reciprocal(value * coefficient)
    }
    
    override func value(fromBaseUnitValue baseUnitValue: Double) -> Double {
        return self.reciprocal(baseUnitValue * coefficient)
    }
    
    private func reciprocal(_ value: Double) -> Double {
        guard value != 0 else {
            return 0
        }
        return 1.0 / value
    }
    
}

