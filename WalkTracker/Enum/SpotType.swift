//
//  SpotType.swift
//  WalkTracker
//
//  Created by 김민구 on 06/03/2019.
//  Copyright © 2019 김민구. All rights reserved.
//

import Foundation

// 쉬, 똥, 질주, 러블리 스팟, 좋은환경, 사나운개, 추천 스팟, 간식타임, 휴식 (파우즈 기능있어야 겠다야), 경고

// MARK: - Initialize
enum SpotType: String {
    case dump = "응가💩"
    case pee = "쉬💦🚽"
}

// MARK: - Value
extension SpotType {
    var unicode: String {
        switch self {
        case .dump:
            return "\u{1F4A9}"
        case .pee:
            return "\u{1F4A6}"
        }
    }
}


