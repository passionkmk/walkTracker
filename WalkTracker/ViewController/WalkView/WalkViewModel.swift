//
//  WalkViewModel.swift
//  WalkTracker
//
//  Created by 김민구 on 27/01/2019.
//  Copyright © 2019 김민구. All rights reserved.
//

import Foundation
import CoreLocation
import MapKit

// MARK: - Walker Protocol
protocol Walker {
    var locations: [CLLocation] { get set }
    var distance: Measurement<UnitLength> { get set }
    var time: Int { get set }
    var mapView: MKMapView { get }
    func startWalk()
    func endWalk()
}

public protocol WalkViewModelDelegate: class {
    func walkForTime(distance: String, time: String, pace: String)
}

// MARK: - Main Class
public class WalkViewModel: NSObject, Walker {

    let locationManager = LocationManager.shared
    
    var locations: [CLLocation]
    var distance: Measurement<UnitLength>
    var time: Int
    var mapView: MKMapView
    
    weak var delegate: WalkViewModelDelegate?
    
    private var walkTimer: Timer?
    
    init(mapView: MKMapView) {
        self.mapView = mapView
        self.locations = []
        self.distance = Measurement(value: 0, unit: UnitLength.meters)
        self.time = 0
    }
    
    deinit {
        
    }
}

// MARK: - Public Functions
extension WalkViewModel {
    func startWalk() {
        self.setLocationConfig()
        self.time = 0
        self.distance = Measurement(value: 0, unit: UnitLength.meters)
        self.locations.removeAll()
        self.walkTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { _ in
            self.walkTime()
        })
        self.locationManager.startUpdatingLocation()
    }
    
    func endWalk() {
        self.locationManager.stopUpdatingLocation()
        self.walkTimer?.invalidate()
        self.saveWalk()
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
        self.delegate?.walkForTime(distance: distance,
                            time: time,
                            pace: pace)
    }
    
    private func saveWalk() {
        // TODO: - Save Walk
    }
}


// MARK: - CLLocationManager Delegate
extension WalkViewModel: CLLocationManagerDelegate {
    private func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // TODO: - 현위치만 보이는 맵에 기능에 대한 고려가 필요
        for location in locations {
            let howRecent = location.timestamp.timeIntervalSinceNow
            // MEMO: - 현재위치와 20미터 내 오차가 있는지, 위치가 최근에 찍힌 것인지
            guard location.horizontalAccuracy < 20 && abs(howRecent) < 10 else {
                continue
            }
            
            if let last = self.locations.last {
                let delta = location.distance(from: last)
                self.distance = self.distance + Measurement(value: delta, unit: UnitLength.meters)
                self.mapView.addLine(last: last.coordinate, new: location.coordinate)
                self.mapView.setFocus(location: location.coordinate)
            }
            
            self.locations.append(location)
        }
    }
}


