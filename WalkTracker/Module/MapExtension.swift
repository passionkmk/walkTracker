//
//  MapExtension.swift
//  WalkTracker
//
//  Created by MinKu Kim on 2019. 2. 8..
//  Copyright © 2019년 김민구. All rights reserved.
//

import Foundation
import MapKit

extension MKMapView {
    func addLine(last: CLLocationCoordinate2D, new: CLLocationCoordinate2D) {
        let coordinates = [last, new]
        let line = MKPolyline(coordinates: coordinates, count: coordinates.count)
        self.addOverlay(line)
    }
    
    func setFocus(location: CLLocationCoordinate2D) {
        let region = MKCoordinateRegion.init(center: location, latitudinalMeters: 500, longitudinalMeters: 500)
        self.setRegion(region, animated: false)
    }
}
