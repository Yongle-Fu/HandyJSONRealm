//
//  BaseModel.swift
//  HandyJSONRealmDemo
//
//  Created by Yongle Fu on 2019/3/15.
//  Copyright © 2019 XXX. All rights reserved.
//

import HandyJSON
import RealmSwift

protocol RealmCollectionValue : RealmSwift.RealmCollectionValue, HandyJSON  {}
extension Int: RealmCollectionValue {}
extension Int8: RealmCollectionValue {}
extension Int16: RealmCollectionValue {}
extension Int32: RealmCollectionValue {}
extension Int64: RealmCollectionValue {}
extension Float: RealmCollectionValue {}
extension Double: RealmCollectionValue {}
extension Bool: RealmCollectionValue {}
extension String: RealmCollectionValue {}
extension Date: RealmCollectionValue {}
extension Data: RealmCollectionValue {}

extension List where Element: RealmCollectionValue {
    var swiftArray: [Element] {
        var result = [Element]()
        self.forEach {
            result.append($0)
        }
        return result
    }
}

@objcMembers class BaseModel: Object, RealmCollectionValue {
    dynamic var createdAt: Date = Date.current
    dynamic var updatedAt: Date = Date.current
    
    override class func primaryKey() -> String? {
        return nil
    }
    
    func mapping(mapper: HelpingMapper) {}
    func didFinishMapping() {}
}





