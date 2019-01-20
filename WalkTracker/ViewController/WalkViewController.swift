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
    
    @IBOutlet weak var starButton: UIButton!
    
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var paceLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}
