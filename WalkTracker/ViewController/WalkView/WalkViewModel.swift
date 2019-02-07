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
        self.setLocationConfig()
    }
    
    deinit {
        
    }
}

// MARK: - Public Functions
extension WalkViewModel {
    func startRun() {
        // TODO: - Start Run
        self.time = 0
        self.distance = Measurement(value: 0, unit: UnitLength.meters)
        self.locations.removeAll()
        self.walkTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { _ in
            self.walkTime()
        })
        self.locationManager.startUpdatingLocation()
    }
    
    func endRun() {
        // TODO: - End Run
    }
}

// MARK: - Private Functions
extension WalkViewModel {
    private func setLocationConfig() {
        self.locationManager.delegate = self
        self.locationManager.activityType = .fitness
        self.locationManager.distanceFilter = 5.0
    }
    
    private func walkTime() {
        self.time += 1
        let distance = Format.distance(self.distance)
        let time = Format.time(self.time)
        let pace = Format.pace(distance: self.distance, seconds: self.time, outputUnit: Unit.minutesPerKilometer)
        self.delegate?.walk(distance: distance,
                            time: time,
                            pace: pace)
    }
}


// MARK: - CLLocationManager Delegate
extension WalkViewModel: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
    }
}


