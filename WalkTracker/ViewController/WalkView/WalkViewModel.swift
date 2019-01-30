//
//  WalkViewModel.swift
//  WalkTracker
//
//  Created by 김민구 on 27/01/2019.
//  Copyright © 2019 김민구. All rights reserved.
//

import Foundation
import CoreLocation

// 거리, 시간, 속도를 계산해서 컨트롤러에 넘겨줌
public protocol Runner: class {
    var locations: [CLLocation] { get set }
    var distance: Measurement<UnitLength> { get set }
    var duration: Int { get set }
    func startRun()
    func endRun()
}

public class WalkViewModel {
    let locationManager = LocationManager.shared
}
