//
//  User.swift
//  RealmAudio
//
//  Created by Юрий Дубровин on 24.01.2021.
//

import Foundation
import RealmSwift

class Autor: Object{
    @objc dynamic var id = 0
    @objc dynamic var name = ""
    let alboms = List<Albom>()
    
    override static func primaryKey() -> String? {
        return "id"
    }
    override static func indexedProperties() -> [String] {
        return ["id"]
    }
}
