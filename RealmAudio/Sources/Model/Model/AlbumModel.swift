//
//  AlbumModel.swift
//  RealmAudio
//
//  Created by Юрий Дубровин on 08.02.2021.
//

import Foundation

struct AlbumModel: Decodable {
    let id: Int
    let name:String
    let song:[SongModel]?
}
