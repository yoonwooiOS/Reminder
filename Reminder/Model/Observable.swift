//
//  Observable.swift
//  Reminder
//
//  Created by 김윤우 on 7/9/24.
//

import Foundation

class Observable<T> {
    var closure:((T) -> Void)?
    
    var value: T {
        didSet {
            closure?(value)
        }
    }
    init(_ value: T) {
        self.value = value
    }
    func bind(closure: @escaping (T) -> Void) {
        self.closure = closure
    }
}
