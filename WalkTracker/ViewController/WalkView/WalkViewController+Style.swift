//
//  WalkViewController+Style.swift
//  WalkTracker
//
//  Created by 김민구 on 20/01/2019.
//  Copyright © 2019 김민구. All rights reserved.
//

import UIKit

extension WalkViewController {
    enum Ready {
        enum Color {
            static let walkButtonColor: UIColor = UIColor(red: 0, green: 0.4784, blue: 1, alpha: 1.0)
        }
    }
    
    enum Walking {
        enum Color {
            static let walkButtonColor: UIColor = UIColor(red: 0.3529, green: 0.7843, blue: 0.9804, alpha: 1.0)
        }
    }
    
    enum Finish {
        enum Color {
            static let walkButtonColor: UIColor = UIColor(red: 1, green: 0.1765, blue: 0.3333, alpha: 1.0)
        }
    }
}


