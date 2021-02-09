//
//  AuthorModel.swift
//  RealmAudio
//
//  Created by Юрий Дубровин on 08.02.2021.
//

import Foundation

struct AuthorModel:Decodable {
    let id: Int
    let name: String
    let album: [AlbumModel]?
    let song: [SongModel]?
}
