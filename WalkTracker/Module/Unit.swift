//
//  Unit.swift
//  WalkTracker
//
//  Created by 김민구 on 03/02/2019.
//  Copyright © 2019 김민구. All rights reserved.
//

import Foundation

enum Unit {
    static let minutesPerKilometer: UnitSpeed = UnitSpeed(symbol: "min/km",
                                                          converter: UnitConverterPace(coefficient: 60.0 / 1000.0))
    static let secondsPerMeter: UnitSpeed = UnitSpeed(symbol: "sec/m",
                                                      converter: UnitConverterPace(coefficient: 1))
}
