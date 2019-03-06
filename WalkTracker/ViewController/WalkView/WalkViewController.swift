//
//  WalkViewController.swift
//  WalkTracker
//
//  Created by 김민구 on 20/01/2019.
//  Copyright © 2019 김민구. All rights reserved.
//

import UIKit
import MapKit

// MARK: - Overrides
class WalkViewController: UIViewController, WalkViewModelDelegate {
    @IBOutlet weak var walkButton: UIButton!
    
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var paceLabel: UILabel!
    
    @IBOutlet weak var mapView: MKMapView!
    
    var walk: WalkViewModel?
    
    private var walkStatus: WalkStatus = .ready {
        willSet {
            self.updateUI(status: newValue)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.walk = WalkViewModel(self, mapView: self.mapView)
        self.updateUI(status: self.walkStatus)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}

// MARK: - Actions
extension WalkViewController {
    @IBAction func walk(_ sender: UIButton) {
        guard let walk = self.walk else {
            return
        }
        
        switch self.walkStatus {
        case .ready:
            self.walkStatus = .walking
            walk.startWalk()
        case .walking:
            self.walkStatus = .finish
            walk.endWalk()
        case .finish:
            self.walkStatus = .ready
            // TODO: - Recoed 및 산책 기록 리스트 업데이트
        }
    }
}

// MARK: - Functions
extension WalkViewController {
    func updateUI(status: WalkStatus) {
        switch status {
        case .ready:
            self.walkButton.setTitle("시작", for: .normal)
            self.walkButton.setTitleColor(Ready.Color.walkButtonColor, for: .normal)
            break
        case .walking:
            self.walkButton.setTitle("산책중..", for: .normal)
            self.walkButton.setTitleColor(Walking.Color.walkButtonColor, for: .normal)
            break
        case .finish:
            self.walkButton.setTitle("종료", for: .normal)
            self.walkButton.setTitleColor(Finish.Color.walkButtonColor, for: .normal)
            break
        }
    }
}

// MARK: - WalkViewModel Delegate
extension WalkViewController {
    func walkForTime(distance: String, time: String, pace: String) {
        self.distanceLabel.text = distance
        self.timeLabel.text = time
        self.paceLabel.text = pace
    }
}
