//
//  WalkViewController.swift
//  WalkTracker
//
//  Created by 김민구 on 20/01/2019.
//  Copyright © 2019 김민구. All rights reserved.
//

import UIKit

// MARK: - Overrides
class WalkViewController: UIViewController {
    @IBOutlet weak var walkButton: UIButton!
    
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var paceLabel: UILabel!
    
    private var walkStatus: WalkStatus = .ready {
        willSet {
            switch newValue {
            case .ready:
                break
            case .walking:
                break
            case .finish:
                break
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}

// MARK: - Actions
extension WalkViewController {
    @IBAction func walk(_ sender: UIButton) {
        switch self.walkStatus {
        case .ready:
            self.walkStatus = .walking
        case .walking:
            self.walkStatus = .finish
        case .finish:
            self.walkStatus = .ready
        }
    }
}
