//
//  WalkViewModel.swift
//  WalkTracker
//
//  Created by 김민구 on 27/01/2019.
//  Copyright © 2019 김민구. All rights reserved.
//

import Foundation
import CoreLocation

// MARK: - Runner Protocol
public protocol Runner: class {
    var locations: [CLLocation] { get set }
    var distance: Measurement<UnitLength> { get set }
    var duration: Int { get set }
    func startRun()
    func endRun()
}

// MARK: - Initialize
public class WalkViewModel: NSObject, Runner {
    let locationManager = LocationManager.shared
    
    public var locations: [CLLocation] = []
    public var distance: Measurement<UnitLength> = Measurement(value: 0, unit: UnitLength.meters)
    public var duration: Int = 0
    
    override init() {
        super.init()
        self.locationManager.delegate = self
    }
    
    deinit {
        
    }
}

extension WalkViewModel {
    public func startRun() {
        // TODO: - Start Run
    }
    
    public func endRun() {
        // TODO: - End Run
    }
}

// MARK: - CLLocationManager Delegate
extension WalkViewModel: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
    }
}


