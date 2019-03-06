//
//  DataModel.swift
//  WalkTracker
//
//  Created by 김민구 on 20/01/2019.
//  Copyright © 2019 김민구. All rights reserved.
//
import Foundation
import RealmSwift

class Walk: Object {
    @objc dynamic var distance: Double = 0.0
    @objc dynamic var time: Int = 0
    @objc dynamic var date: Date = Date(timeIntervalSince1970: 1)
    let locations: List<Location> = List<Location>()
}

class Location: Object {
    @objc dynamic var latitude: Double = 0.0
    @objc dynamic var logitude: Double = 0.0
    @objc dynamic var altitude: Double = 0.0
    @objc dynamic var horizontalAccuracy: Double = 0.0
    @objc dynamic var verticalAccuracy: Double = 0.0
    @objc dynamic var timestamp: Date = Date(timeIntervalSince1970: 1)
}
