//
//  DBModel.swift
//  RealmDataBaseMaster
//
//  Created by Boss on 10/2/19.
//  Copyright © 2019 LuyệnĐào. All rights reserved.
//

import Foundation
import RealmSwift

class UserModel: Object {
    @objc dynamic var userID: String?
    @objc dynamic var id: String?
    @objc dynamic var title: String?
    @objc dynamic var completed: String?
}
