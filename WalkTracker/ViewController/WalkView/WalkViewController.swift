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
            self.updateUI(status: newValue)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateUI(status: self.walkStatus)
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
