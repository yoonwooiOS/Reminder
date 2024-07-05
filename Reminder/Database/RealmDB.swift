//
//  RealmDB.swift
//  Reminder
//
//  Created by 김윤우 on 7/2/24.
//

import Foundation
import RealmSwift

class MemoTable: Object {
    
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted(indexed: true) var memoTitle: String // 메모 제목 필수
    @Persisted var memo: String? // 메모내용(옵션)
    @Persisted var endDate: Date? // 등록일 옵션
    @Persisted var hashTag: String? // 옵션
    @Persisted var priority: String?
    
    convenience init(memoTitle: String, memo: String?, endDate: Date?, hashTag: String?, priority: String? ) {
        self.init()
        self.memoTitle = memoTitle
        self.memo = memo
        self.endDate = endDate
        self.hashTag = hashTag
        self.priority = priority
    }
    
}
