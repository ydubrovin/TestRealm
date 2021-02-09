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
    
    let json = """
    {
      "stat": "ok",
      "author": [
        {
          "id": 0,
          "name": "Denzel Curry",
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
              "name": "TA1300",
              "song": [
                {
                  "id": 2,
                  "name": "TABOO"
                },
                {
                  "id": 3,
                  "name": "BLACK BALLOONS"
                },
                {
                  "id": 4,
                  "name": "CASH MANIAC"
                },
                {
                  "id": 5,
                  "name": "SUMO"
                },
                {
                  "id": 6,
                  "name": "SUPER SAIYAN SUPERMAN"
                }
              ]
            },
            {
              "id": 1,
              "name": "ZUU",
              "song": [
                {
                  "id": 7,
                  "name": "ZUU"
                },
                {
                  "id": 8,
                  "name": "RICKY"
                },
                {
                  "id": 9,
                  "name": "WISH"
                },
                {
                  "id": 10,
                  "name": "BIRDZ"
                },
                {
                  "id": 11,
                  "name": "AUTOMATIC"
                }
              ]
            }
          ]
        },
        {
          "id": 1,
          "name": "The Killers",
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
              "name": "Hot Fuss",
              "song": [
                {
                  "id": 14,
                  "name": "Jenny Was A Friend Of Mine"
                },
                {
                  "id": 15,
                  "name": "Mr.Brightside"
                },
                {
                  "id": 16,
                  "name": "Smile Like You Mean It"
                },
                {
                  "id": 17,
                  "name": "Somebody Told Me"
                },
                {
                  "id": 18,
                  "name": "All These Things That Ive Done"
                }
              ]
            },
            {
              "id": 3,
              "name": "Imploding The Mirage",
              "song": [
                {
                  "id": 19,
                  "name": "Blowback"
                },
                {
                  "id": 20,
                  "name": "Dying Breed"
                },
                {
                  "id": 21,
                  "name": "Caution"
                },
                {
                  "id": 22,
                  "name": "Fire In Bone"
                },
                {
                  "id": 23,
                  "name": "My God"
                }
              ]
            }
          ]
        },
        {
          "id": 2,
          "name": "Travis Scott",
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
              "name": "ASTROWORLD",
              "song": [
                {
                  "id": 26,
                  "name": "STARGAZING"
                },
                {
                  "id": 27,
                  "name": "CAROUSEL"
                },
                {
                  "id": 28,
                  "name": "SICKO MODE"
                },
                {
                  "id": 29,
                  "name": "R.I.P SCREW"
                },
                {
                  "id": 30,
                  "name": "SKELETONS"
                }
              ]
            },
            {
              "id": 5,
              "name": "JACKBOYS",
              "song": [
                {
                  "id": 31,
                  "name": "JACKBOYS"
                },
                {
                  "id": 32,
                  "name": "GANG GANG"
                },
                {
                  "id": 33,
                  "name": "HAD ENOUGH"
                },
                {
                  "id": 34,
                  "name": "OUT WEST"
                },
                {
                  "id": 35,
                  "name": "WHAT TO DO?"
                }
              ]
            }
          ]
        }
      ]
    }
    
    """

    
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
