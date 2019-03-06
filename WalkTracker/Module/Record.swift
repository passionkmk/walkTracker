//
//  Record.swift
//  WalkTracker
//
//  Created by MinKu Kim on 2019. 2. 15..
//  Copyright © 2019년 김민구. All rights reserved.
//

import Foundation
import RealmSwift
import CoreLocation

public struct Record {
    private static let realm = try! Realm()
    
    private init() {}
    
    static func saveWalk(_ info: WalkInfo) {
        
        let walk = Walk()
        walk.time = info.time
        walk.distance = info.distance.value
        walk.date = info.date
        info.locations.forEach { (location) in
            let loca = Location()
            loca.latitude = location.coordinate.latitude
            loca.logitude = location.coordinate.longitude
            loca.altitude = location.altitude
            loca.horizontalAccuracy = location.horizontalAccuracy
            loca.verticalAccuracy = location.verticalAccuracy
            loca.timestamp = location.timestamp
            walk.locations.append(loca)
        }
        
        do {
            try realm.write {
                realm.add(walk)
            }
        }
        catch {
            d("Walk Save Failed.")
        }
    }
    
    static func loadWalk() -> [WalkInfo] {
        let walks: [WalkInfo] = realm.objects(Walk.self).map { (walk) -> WalkInfo in
            let time = walk.time
            let date = walk.date
            let distance = Measurement(value: walk.distance, unit: UnitLength.meters)
            let locations: [CLLocation] = walk.locations
                .compactMap { CLLocation(coordinate: CLLocationCoordinate2DMake($0.latitude, $0.logitude),
                                  altitude: $0.altitude,
                                  horizontalAccuracy: $0.horizontalAccuracy,
                                  verticalAccuracy: $0.verticalAccuracy,
                                  timestamp: $0.timestamp) }
            
            return WalkInfo(locations: locations,
                            distance: distance,
                            time: time,
                            date: date)
        }
        
        return walks
    }
    
    static func loadWalk(date: Date) -> WalkInfo? {
        return nil
        // TODO: - Realm walk 로드
    }
}
