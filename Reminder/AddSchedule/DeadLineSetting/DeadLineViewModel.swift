//
//  DeadLineViewModel.swift
//  Reminder
//
//  Created by 김윤우 on 7/9/24.
//

import Foundation

class DeadLineViewModel {
    
    var inputCalenderDateClicked: Observable<Date?> = Observable(nil)
    
    var outPudText = Observable("")
    
    init() {
        inputCalenderDateClicked.bind { _ in
            self.dateToString()
        }
    }
    
    private func dateToString() {
        guard let date = inputCalenderDateClicked.value, let stringDate = date.dateToString() else { return }
        outPudText.value = stringDate
        
    }
    
}
