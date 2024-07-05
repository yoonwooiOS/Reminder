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
            return ["오늘", "calendar.circle"]
        case .expected:
            return ["예정","calendar.circle.fill"]
        case .all:
            return ["전체", "calendar.badge.clock"]
        case .flag:
            return ["깃발 표시","flag.circle"]
        case .complete:
            return ["완료됨", "checkmark.circle.fill"]
        }
    }
}

