//
//  CollectionView.swift
//  Reminder
//
//  Created by 김윤우 on 7/4/24.
//

import Foundation

enum ScheduleSummary: CaseIterable {
    
    case today, expected, all, flag, complete
    
    var cellComponent: [String] {
        switch self {
            
        case .today:
            return ["오늘", "calendar"]
        case .expected:
            return ["예정","calendar.badge.clock"]
        case .all:
            return ["전체", "tray.fill"]
        case .flag:
            return ["깃발 표시","flag.fill"]
        case .complete:
            return ["완료됨", "checkmark"]
        }
    }
}

