//
//  HandyJSONTransform.swift
//  HandyJSONRealmDemo
//
//  Created by Yongle Fu on 2019/3/15.
//  Copyright © 2019 XXX. All rights reserved.
//

import HandyJSON
import RealmSwift

struct RealmListTransform<T: RealmCollectionValue>: TransformType {
    public typealias Object = List<T>
    public typealias JSON = [T]

    public func transformFromJSON(_ value: Any?) -> List<T>? {
        guard let array = value as? [Any] else { return nil }

        let list = List<T>()
        let realmValues: [T] = array.compactMap {
            if let dict = $0 as? [String: Any] {
                return JSONDeserializer<T>.deserializeFrom(dict: dict)
            }
            return $0 as? T
        }
        list.append(objectsIn: realmValues)

        return list
    }

    public func transformToJSON(_ value: List<T>?) -> [T]? {
        return value?.swiftArray ?? []
    }
}


