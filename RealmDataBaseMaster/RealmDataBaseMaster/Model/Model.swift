//
//  Model.swift
//  RealmDataBaseMaster
//
//  Created by Boss on 10/2/19.
//  Copyright © 2019 LuyệnĐào. All rights reserved.
//

import Foundation
import ObjectMapper

struct UserInfo: Mappable {
    var userId: Int?
    var id: Int?
    var title: String?
    var completed: Bool?
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        self.userId <- map["userId"]
        self.id <- map["id"]
        self.title <- map["title"]
        self.completed <- map["completed"]
    }
}
