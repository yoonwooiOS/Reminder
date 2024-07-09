//
//  MemoTableRepository.swift
//  Reminder
//
//  Created by 김윤우 on 7/8/24.
//

import Foundation
import RealmSwift

final class MemoTableRepository {
    
    private let realm = try! Realm()
    
    func createItem(_ data: MemoTable) {
        do {
            try realm.write {
                realm.add(data)
                print("Realm Create Succed")
            }
        } catch {
            print("Realm Error")
        }
    }
    
    func fetchAll() ->  [MemoTable] {
       let value = realm.objects(MemoTable.self).sorted(byKeyPath: "price", ascending: false)
        return Array(value)
    }
    
    func upDate() {
        
    }
    
    func deleteItem(_ data: MemoTable) {
        do {
            try realm.write {
                realm.delete(data)
            }
            
        } catch {
            print("Realm Error")
        }
        
    }
}
