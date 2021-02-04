//
//  PlayListModel.swift
//  RealmAudio
//
//  Created by Юрий Дубровин on 05.02.2021.
//

import Foundation

import Foundation
import RealmSwift
class PlayListModel: Object{
    @objc dynamic var id = 0
    @objc dynamic var name = ""
    let songs = List<Song>()
    
    override static func primaryKey() -> String? {
        return "id"
    }
    override static func indexedProperties() -> [String] {
        return ["id"]
    }
}
