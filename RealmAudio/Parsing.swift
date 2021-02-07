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
// MARK: - json1
    let json1 = """
    {
      "stat": "ok",
      "author": [
        {
          "id": 0,
          "name": "Maynard",
          "song": [
            {
              "id": 0,
              "name": "Song0"
            },
            {
              "id": 1,
              "name": "Song1"
            },
            {
              "id": 2,
              "name": "Song2"
            },
            {
              "id": 3,
              "name": "Song3"
            }
          ],
          "album": [
            {
              "id": 0,
              "name": "album 0",
              "song": [
                {
                  "id": 4,
                  "name": "Song0"
                },
                {
                  "id": 5,
                  "name": "Song1"
                },
                {
                  "id": 6,
                  "name": "Song2"
                },
                {
                  "id": 7,
                  "name": "Song3"
                },
                {
                  "id": 8,
                  "name": "Song4"
                },
                {
                  "id": 9,
                  "name": "Song5"
                },
                {
                  "id": 10,
                  "name": "Song6"
                },
                {
                  "id": 11,
                  "name": "Song7"
                },
                {
                  "id": 12,
                  "name": "Song8"
                },
                {
                  "id": 13,
                  "name": "Song9"
                }
              ]
            },
            {
              "id": 1,
              "name": "album 1",
              "song": [
                {
                  "id": 14,
                  "name": "Song0"
                },
                {
                  "id": 15,
                  "name": "Song1"
                },
                {
                  "id": 16,
                  "name": "Song2"
                },
                {
                  "id": 17,
                  "name": "Song3"
                },
                {
                  "id": 18,
                  "name": "Song4"
                },
                {
                  "id": 19,
                  "name": "Song5"
                },
                {
                  "id": 20,
                  "name": "Song6"
                },
                {
                  "id": 21,
                  "name": "Song7"
                },
                {
                  "id": 22,
                  "name": "Song8"
                },
                {
                  "id": 23,
                  "name": "Song9"
                }
              ]
            }
          ]
        },
        {
          "id": 1,
          "name": "Lizzie",
          "song": [
            {
              "id": 24,
              "name": "Song0"
            },
            {
              "id": 25,
              "name": "Song1"
            },
            {
              "id": 26,
              "name": "Song2"
            },
            {
              "id": 27,
              "name": "Song3"
            }
          ],
          "album": [
            {
              "id": 2,
              "name": "album 0",
              "song": [
                {
                  "id": 28,
                  "name": "Song0"
                },
                {
                  "id": 29,
                  "name": "Song1"
                },
                {
                  "id": 30,
                  "name": "Song2"
                },
                {
                  "id": 31,
                  "name": "Song3"
                },
                {
                  "id": 32,
                  "name": "Song4"
                },
                {
                  "id": 33,
                  "name": "Song5"
                },
                {
                  "id": 34,
                  "name": "Song6"
                },
                {
                  "id": 35,
                  "name": "Song7"
                },
                {
                  "id": 36,
                  "name": "Song8"
                },
                {
                  "id": 37,
                  "name": "Song9"
                }
              ]
            },
            {
              "id": 3,
              "name": "album 1",
              "song": [
                {
                  "id": 38,
                  "name": "Song0"
                },
                {
                  "id": 39,
                  "name": "Song1"
                },
                {
                  "id": 40,
                  "name": "Song2"
                },
                {
                  "id": 41,
                  "name": "Song3"
                },
                {
                  "id": 42,
                  "name": "Song4"
                },
                {
                  "id": 43,
                  "name": "Song5"
                },
                {
                  "id": 44,
                  "name": "Song6"
                },
                {
                  "id": 45,
                  "name": "Song7"
                },
                {
                  "id": 46,
                  "name": "Song8"
                },
                {
                  "id": 47,
                  "name": "Song9"
                }
              ]
            }
          ]
        },
        {
          "id": 2,
          "name": "Brewer",
          "song": [
            {
              "id": 48,
              "name": "Song0"
            },
            {
              "id": 49,
              "name": "Song1"
            },
            {
              "id": 50,
              "name": "Song2"
            },
            {
              "id": 51,
              "name": "Song3"
            }
          ],
          "album": [
            {
              "id": 4,
              "name": "album 0",
              "song": [
                {
                  "id": 52,
                  "name": "Song0"
                },
                {
                  "id": 53,
                  "name": "Song1"
                },
                {
                  "id": 54,
                  "name": "Song2"
                },
                {
                  "id": 55,
                  "name": "Song3"
                },
                {
                  "id": 56,
                  "name": "Song4"
                },
                {
                  "id": 57,
                  "name": "Song5"
                },
                {
                  "id": 58,
                  "name": "Song6"
                },
                {
                  "id": 59,
                  "name": "Song7"
                },
                {
                  "id": 60,
                  "name": "Song8"
                },
                {
                  "id": 61,
                  "name": "Song9"
                }
              ]
            },
            {
              "id": 5,
              "name": "album 1",
              "song": [
                {
                  "id": 62,
                  "name": "Song0"
                },
                {
                  "id": 63,
                  "name": "Song1"
                },
                {
                  "id": 64,
                  "name": "Song2"
                },
                {
                  "id": 65,
                  "name": "Song3"
                },
                {
                  "id": 66,
                  "name": "Song4"
                },
                {
                  "id": 67,
                  "name": "Song5"
                },
                {
                  "id": 68,
                  "name": "Song6"
                },
                {
                  "id": 69,
                  "name": "Song7"
                },
                {
                  "id": 70,
                  "name": "Song8"
                },
                {
                  "id": 71,
                  "name": "Song9"
                }
              ]
            }
          ]
        },
        {
          "id": 3,
          "name": "Erickson",
          "song": [
            {
              "id": 72,
              "name": "Song0"
            },
            {
              "id": 73,
              "name": "Song1"
            },
            {
              "id": 74,
              "name": "Song2"
            },
            {
              "id": 75,
              "name": "Song3"
            }
          ],
          "album": [
            {
              "id": 6,
              "name": "album 0",
              "song": [
                {
                  "id": 76,
                  "name": "Song0"
                },
                {
                  "id": 77,
                  "name": "Song1"
                },
                {
                  "id": 78,
                  "name": "Song2"
                },
                {
                  "id": 79,
                  "name": "Song3"
                },
                {
                  "id": 80,
                  "name": "Song4"
                },
                {
                  "id": 81,
                  "name": "Song5"
                },
                {
                  "id": 82,
                  "name": "Song6"
                },
                {
                  "id": 83,
                  "name": "Song7"
                },
                {
                  "id": 84,
                  "name": "Song8"
                },
                {
                  "id": 85,
                  "name": "Song9"
                }
              ]
            },
            {
              "id": 7,
              "name": "album 1",
              "song": [
                {
                  "id": 86,
                  "name": "Song0"
                },
                {
                  "id": 87,
                  "name": "Song1"
                },
                {
                  "id": 88,
                  "name": "Song2"
                },
                {
                  "id": 89,
                  "name": "Song3"
                },
                {
                  "id": 90,
                  "name": "Song4"
                },
                {
                  "id": 91,
                  "name": "Song5"
                },
                {
                  "id": 92,
                  "name": "Song6"
                },
                {
                  "id": 93,
                  "name": "Song7"
                },
                {
                  "id": 94,
                  "name": "Song8"
                },
                {
                  "id": 95,
                  "name": "Song9"
                }
              ]
            }
          ]
        },
        {
          "id": 4,
          "name": "Rhoda",
          "song": [
            {
              "id": 96,
              "name": "Song0"
            },
            {
              "id": 97,
              "name": "Song1"
            },
            {
              "id": 98,
              "name": "Song2"
            },
            {
              "id": 99,
              "name": "Song3"
            }
          ],
          "album": [
            {
              "id": 8,
              "name": "album 0",
              "song": [
                {
                  "id": 100,
                  "name": "Song0"
                },
                {
                  "id": 101,
                  "name": "Song1"
                },
                {
                  "id": 102,
                  "name": "Song2"
                },
                {
                  "id": 103,
                  "name": "Song3"
                },
                {
                  "id": 104,
                  "name": "Song4"
                },
                {
                  "id": 105,
                  "name": "Song5"
                },
                {
                  "id": 106,
                  "name": "Song6"
                },
                {
                  "id": 107,
                  "name": "Song7"
                },
                {
                  "id": 108,
                  "name": "Song8"
                },
                {
                  "id": 109,
                  "name": "Song9"
                }
              ]
            },
            {
              "id": 9,
              "name": "album 1",
              "song": [
                {
                  "id": 110,
                  "name": "Song0"
                },
                {
                  "id": 111,
                  "name": "Song1"
                },
                {
                  "id": 112,
                  "name": "Song2"
                },
                {
                  "id": 113,
                  "name": "Song3"
                },
                {
                  "id": 114,
                  "name": "Song4"
                },
                {
                  "id": 115,
                  "name": "Song5"
                },
                {
                  "id": 116,
                  "name": "Song6"
                },
                {
                  "id": 117,
                  "name": "Song7"
                },
                {
                  "id": 118,
                  "name": "Song8"
                },
                {
                  "id": 119,
                  "name": "Song9"
                }
              ]
            }
          ]
        }
      ]
    }
    
    """
    // MARK: - json
    let json = """
   {
     "stat": "ok",
     "results": [
       {
         "id": 0,
         "name": "Reynolds",
         "album": [
           {
             "id": 0,
             "name": "album",
             "greeting": "Hello, 0! You have 5 unread messages."
           },
           {
             "id": 1,
             "name": "album",
             "greeting": "Hello, 1! You have 7 unread messages."
           }
         ]
       },
       {
         "id": 1,
         "name": "Deanna",
         "album": [
           {
             "id": 0,
             "name": "album",
             "greeting": "Hello, 0! You have 5 unread messages."
           },
           {
             "id": 1,
             "name": "album",
             "greeting": "Hello, 1! You have 5 unread messages."
           }
         ]
       },
       {
         "id": 2,
         "name": "Saunders",
         "album": [
           {
             "id": 0,
             "name": "album",
             "greeting": "Hello, 0! You have 7 unread messages."
           },
           {
             "id": 1,
             "name": "album",
             "greeting": "Hello, 1! You have 5 unread messages."
           }
         ]
       },
       {
         "id": 3,
         "name": "Davidson",
         "album": [
           {
             "id": 0,
             "name": "album",
             "greeting": "Hello, 0! You have 8 unread messages."
           },
           {
             "id": 1,
             "name": "album",
             "greeting": "Hello, 1! You have 6 unread messages."
           }
         ]
       },
       {
         "id": 4,
         "name": "Blake",
         "album": [
           {
             "id": 0,
             "name": "album",
             "greeting": "Hello, 0! You have 5 unread messages."
           },
           {
             "id": 1,
             "name": "album",
             "greeting": "Hello, 1! You have 9 unread messages."
           }
         ]
       }
     ],
     "song": [
       {
         "id": 0,
         "name": "Song0",
         "idAuthor": 1,
         "idAlbum": 1
       },
       {
         "id": 1,
         "name": "Song1",
         "idAuthor": 1,
         "idAlbum": 1
       },
       {
         "id": 2,
         "name": "Song2",
         "idAuthor": 1,
         "idAlbum": 1
       },
       {
         "id": 3,
         "name": "Song3",
         "idAuthor": 1,
         "idAlbum": 1
       },
       {
         "id": 4,
         "name": "Song4",
         "idAuthor": 1,
         "idAlbum": 1
       },
       {
         "id": 5,
         "name": "Song5",
         "idAuthor": 1,
         "idAlbum": 1
       },
       {
         "id": 6,
         "name": "Song6",
         "idAuthor": 1,
         "idAlbum": 1
       },
       {
         "id": 7,
         "name": "Song7",
         "idAuthor": 1,
         "idAlbum": 1
       },
       {
         "id": 8,
         "name": "Song8",
         "idAuthor": 1,
         "idAlbum": 1
       },
       {
         "id": 9,
         "name": "Song9",
         "idAuthor": 1,
         "idAlbum": 1
       },
       {
         "id": 10,
         "name": "Song10",
         "idAuthor": 1,
         "idAlbum": 1
       },
       {
         "id": 11,
         "name": "Song11",
         "idAuthor": 1,
         "idAlbum": 1
       },
       {
         "id": 12,
         "name": "Song12",
         "idAuthor": 1,
         "idAlbum": 1
       },
       {
         "id": 13,
         "name": "Song13",
         "idAuthor": 1,
         "idAlbum": 1
       },
       {
         "id": 14,
         "name": "Song14",
         "idAuthor": 1,
         "idAlbum": 1
       },
       {
         "id": 15,
         "name": "Song15",
         "idAuthor": 1,
         "idAlbum": 1
       },
       {
         "id": 16,
         "name": "Song16",
         "idAuthor": 1,
         "idAlbum": 1
       },
       {
         "id": 17,
         "name": "Song17",
         "idAuthor": 1,
         "idAlbum": 1
       },
       {
         "id": 18,
         "name": "Song18",
         "idAuthor": 1,
         "idAlbum": 1
       },
       {
         "id": 19,
         "name": "Song19",
         "idAuthor": 1,
         "idAlbum": 1
       }
     ]
   }
   """
}
