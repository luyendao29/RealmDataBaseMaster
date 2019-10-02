//
//  DBManager.swift
//  RealmDataBaseMaster
//
//  Created by Boss on 10/2/19.
//  Copyright © 2019 LuyệnĐào. All rights reserved.
//

import Foundation
import RealmSwift

class DBManager: NSObject {
    static let sharedDB: DBManager = DBManager()
    let realm = try! Realm()
    
    func saveAll(userID: String?, id: String?, title: String?, completed: String?) {
        let newUser = UserModel()
        
        try! realm.write {
            newUser.userID = userID
            newUser.id = id
            newUser.title = title
            newUser.completed = completed
            
            realm.add(newUser)
        }
    }
    
    func deleteALL() {
        try! realm.write {
            realm.deleteAll()
        }
    }
}
