//
//  AlbomModel.swift
//  RealmAudio
//
//  Created by Юрий Дубровин on 24.01.2021.
//

import Foundation
import RealmSwift

class Albom: Object{
    @objc dynamic var id = 0
    @objc dynamic var name = ""
    @objc dynamic var dateRealise = Date(timeIntervalSince1970: 1)
    let songs = List<Song>()
    let owners = LinkingObjects(fromType: Autor.self, property:"alboms")
    
    override static func primaryKey() -> String? {
        return "id"
    }
    override static func indexedProperties() -> [String] {
        return ["id"]
    }
}
