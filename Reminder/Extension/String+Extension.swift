//
//  String+Extension.swift
//  Reminder
//
//  Created by 김윤우 on 7/6/24.
//

import Foundation

extension String {
    
    func stringToDate() -> Date? {
        let myFormatter = DateFormatter()
        myFormatter.dateFormat = "yyyy-MM-dd"
        myFormatter.timeZone = TimeZone(identifier: "Asia/Seoul")
        let date = myFormatter.date(from: self)
        return date
    }
    
    
}
