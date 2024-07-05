//
//  Date+Extension.swift
//  Reminder
//
//  Created by 김윤우 on 7/6/24.
//

import Foundation

extension Date {
    func dateToString() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy년 MM월 dd일"
        let stringDate = dateFormatter.string(from: self)
        return stringDate
    }
    
        func toKST() -> Date? {
            let timeZone = TimeZone(identifier: "Asia/Seoul")!
            let secondsFromGMT = TimeInterval(timeZone.secondsFromGMT(for: self))
            return addingTimeInterval(secondsFromGMT - TimeInterval(TimeZone.current.secondsFromGMT(for: self)))
        }
    
}
