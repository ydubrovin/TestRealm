//
//  SongModel.swift
//  RealmAudio
//
//  Created by Юрий Дубровин on 24.01.2021.
//

import Foundation
import RealmSwift
class Song: Object{
    @objc dynamic var id = 0
    @objc dynamic var name = ""
    let albom = LinkingObjects(fromType: Album.self, property:"songs")
    let author = LinkingObjects(fromType: Author.self, property: "songs")
    
    override static func primaryKey() -> String? {
        return "id"
    }
    override static func indexedProperties() -> [String] {
        return ["id"]
    }
}
