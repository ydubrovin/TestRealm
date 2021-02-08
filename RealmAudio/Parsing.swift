//
//  Parsing.swift
//  RealmAudio
//
//  Created by Юрий Дубровин on 06.02.2021.
//

import Foundation

struct Stat:Decodable {
    let stat:String
    let author:[AuthorModel]
}



struct MyJson{
    
    // MARK: - json2
    let json2 = """
    {
      "stat": "ok",
      "author": [
        {
          "id": 0,
          "name": "Desiree",
          "song": [
            {
              "id": 0,
              "name": "Song0"
            },
            {
              "id": 1,
              "name": "Song1"
            }
          ],
          "album": [
            {
              "id": 0,
              "name": "album 0",
              "song": [
                {
                  "id": 2,
                  "name": "SongAlbum0"
                },
                {
                  "id": 3,
                  "name": "SongAlbum1"
                },
                {
                  "id": 4,
                  "name": "SongAlbum2"
                },
                {
                  "id": 5,
                  "name": "SongAlbum3"
                },
                {
                  "id": 6,
                  "name": "SongAlbum4"
                }
              ]
            },
            {
              "id": 1,
              "name": "album 1",
              "song": [
                {
                  "id": 7,
                  "name": "SongAlbum0"
                },
                {
                  "id": 8,
                  "name": "SongAlbum1"
                },
                {
                  "id": 9,
                  "name": "SongAlbum2"
                },
                {
                  "id": 10,
                  "name": "SongAlbum3"
                },
                {
                  "id": 11,
                  "name": "SongAlbum4"
                }
              ]
            }
          ]
        },
        {
          "id": 1,
          "name": "Barbra",
          "song": [
            {
              "id": 12,
              "name": "Song0"
            },
            {
              "id": 13,
              "name": "Song1"
            }
          ],
          "album": [
            {
              "id": 2,
              "name": "album 0",
              "song": [
                {
                  "id": 14,
                  "name": "SongAlbum0"
                },
                {
                  "id": 15,
                  "name": "SongAlbum1"
                },
                {
                  "id": 16,
                  "name": "SongAlbum2"
                },
                {
                  "id": 17,
                  "name": "SongAlbum3"
                },
                {
                  "id": 18,
                  "name": "SongAlbum4"
                }
              ]
            },
            {
              "id": 3,
              "name": "album 1",
              "song": [
                {
                  "id": 19,
                  "name": "SongAlbum0"
                },
                {
                  "id": 20,
                  "name": "SongAlbum1"
                },
                {
                  "id": 21,
                  "name": "SongAlbum2"
                },
                {
                  "id": 22,
                  "name": "SongAlbum3"
                },
                {
                  "id": 23,
                  "name": "SongAlbum4"
                }
              ]
            }
          ]
        },
        {
          "id": 2,
          "name": "Montgomery",
          "song": [
            {
              "id": 24,
              "name": "Song0"
            },
            {
              "id": 25,
              "name": "Song1"
            }
          ],
          "album": [
            {
              "id": 4,
              "name": "album 0",
              "song": [
                {
                  "id": 26,
                  "name": "SongAlbum0"
                },
                {
                  "id": 27,
                  "name": "SongAlbum1"
                },
                {
                  "id": 28,
                  "name": "SongAlbum2"
                },
                {
                  "id": 29,
                  "name": "SongAlbum3"
                },
                {
                  "id": 30,
                  "name": "SongAlbum4"
                }
              ]
            },
            {
              "id": 5,
              "name": "album 1",
              "song": [
                {
                  "id": 31,
                  "name": "SongAlbum0"
                },
                {
                  "id": 32,
                  "name": "SongAlbum1"
                },
                {
                  "id": 33,
                  "name": "SongAlbum2"
                },
                {
                  "id": 34,
                  "name": "SongAlbum3"
                },
                {
                  "id": 35,
                  "name": "SongAlbum4"
                }
              ]
            }
          ]
        }
      ]
    }
    
    """
}
