//
//  WalkModel.swift
//  WalkTracker
//
//  Created by MinKu Kim on 2019. 2. 15..
//  Copyright © 2019년 김민구. All rights reserved.
//

import Foundation
import MapKit

struct WalkInfo {
    var locations: [CLLocation]
    var distance: Measurement<UnitLength>
    var time: Int
    var date: Date
}
