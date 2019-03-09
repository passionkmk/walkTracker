//
//  SpotType.swift
//  WalkTracker
//
//  Created by 김민구 on 06/03/2019.
//  Copyright © 2019 김민구. All rights reserved.
//

import Foundation

// MARK: - Initialize
enum SpotType: String {
    case dump = "응가💩"          // "U+1F4A9"
    case pee = "쉬💦🚽"          // "U+1F4A6", "U+1F6BD"
    case heart = "하트💕"         // "U+1F495"
    case snack = "간식🍖"         // "U+1F356"
    case dog = "개🐶"            // "U+1F436"
    case warning = "경고⚠️"       // "U+26A0"
    case noEntry = "접근금지⛔"    // "U+26D4"
    case playGround = "놀이터🎾"   // "U+1F3BE"
    case likePlace = "좋아하는장소🐾"  // "U+1F43E"
}

// MARK: - Value
extension SpotType {
    var unicode: String {
        switch self {
        case .dump:
            return "\u{1F4A9}"
        case .pee:
            return "\u{1F4A6}"
        case .heart:
            return "\u{1F495}"
        case .snack:
            return "\u{1F356}"
        case .dog:
            return "\u{1F436}"
        case .warning:
            return "\u{26A0}"
        case .noEntry:
            return "\u{26D4}"
        case .playGround:
            return "\u{1F3BE}"
        case .likePlace:
            return "\u{1F43E}"
        }
    }
}


