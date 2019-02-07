//
//  WalkViewModel.swift
//  WalkTracker
//
//  Created by 김민구 on 27/01/2019.
//  Copyright © 2019 김민구. All rights reserved.
//

import Foundation
import CoreLocation

// MARK: - Walker Protocol
protocol Walker {
    var locations: [CLLocation] { get set }
    var distance: Measurement<UnitLength> { get set }
    var time: Int { get set }
    func startRun()
    func endRun()
}

public protocol WalkViewModelDelegate: class {
    func walk(distance: String, time: String, pace: String)
}

// MARK: - Initialize
public class WalkViewModel: NSObject, Walker {
    let locationManager = LocationManager.shared
    
    var locations: [CLLocation] = []
    var distance: Measurement<UnitLength> = Measurement(value: 0, unit: UnitLength.meters)
    var time: Int = 0
    
    weak var delegate: WalkViewModelDelegate?
    
    private var walkTimer: Timer?
    
    override init() {
        super.init()
        self.locationManager.delegate = self
    }
    
    deinit {
        
    }
}

// MARK: - Public Functions
extension WalkViewModel {
    func startRun() {
        // TODO: - Start Run
    }
    
    func endRun() {
        // TODO: - End Run
    }
}

// MARK: - Private Functions
extension WalkViewModel {
    private func walkTime() {
        self.time += 1
    }
}


// MARK: - CLLocationManager Delegate
extension WalkViewModel: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
    }
}


