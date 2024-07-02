//
//  ReusableIdentifier.swift
//  Reminder
//
//  Created by 김윤우 on 7/2/24.
//

import Foundation

extension NSObjectProtocol {
    
    static var identifier: String {
        return String(describing: self)
    }
    
}
