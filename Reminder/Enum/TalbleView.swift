//
//  TalbleView.swift
//  Reminder
//
//  Created by 김윤우 on 7/3/24.
//

import Foundation

enum MemoOtions: String,CaseIterable {
    
    case deadline, tag, priorityRank, addImage
    
    var buttonTitle: String {
        switch self {
        case .deadline:
            return "마감일"
        case .tag:
            return "태그"
        case .priorityRank:
            return "우선순위"
        case .addImage:
            return "이미지 추가"
        }
    }
    
}

