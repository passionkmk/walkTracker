//
//  Record.swift
//  WalkTracker
//
//  Created by MinKu Kim on 2019. 2. 15..
//  Copyright © 2019년 김민구. All rights reserved.
//

import Foundation

public struct Record {
    static func saveWalk(_ info: WalkInfo) {
        // TODO: - Realm walk data 저장
    }
    
    static func loadWalk() -> [WalkInfo] {
        return []
        // TODO: - Realm walk data 로드
    }
    
    static func loadWalk(date: Date) -> WalkInfo? {
        return nil
        // TODO: - Realm walk 로드
    }
}
