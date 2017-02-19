//
//  DatabaseObject.swift
//  MoneyManager
//
//  Created by Thai Duong on 2/18/17.
//  Copyright © 2017 ThaiDuong. All rights reserved.
//

import Foundation
import RealmSwift



class ChildIndex: Object {
    dynamic var childName : String!
    dynamic var status : String = ""
}

class Index : Object {
    dynamic var dadName : String = ""
    let childName = List<ChildIndex>()
    
}

class Account: Object {
    dynamic var nameAcc : String!
    dynamic var money: Int = 0
    dynamic var status :String = ""
    dynamic var image : String!
}

class Record : Object {
    dynamic var money : Int = 0
    dynamic var spent : String = ""
    dynamic var status : String = ""
    dynamic var date : String!
    dynamic var spentFor : String = ""
    dynamic var event : String = ""
}
