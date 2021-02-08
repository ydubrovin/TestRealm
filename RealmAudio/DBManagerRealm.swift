//
//  FIleManagerBDRealm.swift
//  RealmAudio
//
//  Created by Юрий Дубровин on 31.01.2021.
//

import Foundation
import RealmSwift

class DBManagerRealm: NSObject{
    static let sharedManager = DBManagerRealm()
    
    override required init(){
        super.init()
        self.getDatabaseOrCreateNew()
    }
    
    func getDatabaseOrCreateNew(){
        let path = Realm.Configuration.defaultConfiguration.fileURL?.path
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: path!){
            print("file exists")
            print(path)
        }else{
            //self.createDataBase()
            self.parsing()
            print("create database")
        }
        print(path)
    }
    
    func deleteAll(){
        do {
            let realm = try Realm()
            realm.deleteAll()
        } catch let error as NSError {
            print(error)
        }
    }
    
    func addAuthor(author: AuthorModel){
        let authorRealm = Author()
        //authorRealm.id = 0
        authorRealm.name = author.name
        do{
            let realm = try Realm()
            var lastId = realm.objects(Author.self).last?.id
            if lastId == nil{
                lastId = 0
            }else{
                lastId = lastId! + 1
            }
            authorRealm.id = lastId!
            print(Realm.Configuration.defaultConfiguration.fileURL!)
            try realm.write{
                realm.add(authorRealm)
            }
        } catch{
            print("error")
        }
    }

    func addAlbum(album: AlbumModel, idAuthor: Int){
        let albumRealm = Album()
        albumRealm.name = album.name
        do{
            let realm = try Realm()
            var lastId = realm.objects(Album.self).last?.id
            if lastId == nil{
                lastId = 0
            }else{
                lastId = lastId! + 1
            }
            let author = realm.objects(Author.self).filter("id == \(idAuthor)")
            albumRealm.id = lastId!
        try realm.write{
                realm.add(albumRealm)
                author[0].alboms.append(albumRealm)
            }
        }catch{
            print("error")
        }
    }

    func addSong(IdAuthor: Int, IdAlbum: Int?,song:SongModel ){
        let songRealm = Song()
        songRealm.name = song.name
        do{
            let realm = try Realm()
            var lastId = realm.objects(Song.self).last?.id
            if lastId == nil{
                lastId = 0
            }else{
                lastId = lastId! + 1
            }
            let author = realm.objects(Author.self).filter("id == \(IdAuthor)")
            songRealm.id = lastId!
            try realm.write{
                realm.add(songRealm)
                author[0].songs.append(songRealm)
                if IdAlbum != nil{
                    let album = realm.objects(Album.self).filter("id == \(IdAlbum!)")
                    album[0].songs.append(songRealm)
                }
            }
        } catch{
            print("error")
        }
    }

    func deleteAuthor(id: Int){
        do {
            let realm = try Realm()
        let deleteAuthor = realm.objects(Author.self).filter("id == \(id)")
        do {
            try realm.write{
                for deleteSong in deleteAuthor[0].songs{
                    realm.delete(deleteSong)
                }
                for deleteAulbum in deleteAuthor[0].alboms{
                    realm.delete(deleteAulbum)
                }
                realm.delete(deleteAuthor)
            }
        }catch{
            print("error")
        }
        } catch let error as NSError{
            print(error)
        }
    }

    func deleteSong(id: Int){
        do{
            let realm = try Realm()
        let deleteSong = realm.objects(Song.self).filter("id == \(id)")
        do{
            try realm.write{
                realm.delete(deleteSong)
            }
        } catch{
            print("error")
        }
        } catch{
            
        }
    }

    func deleteAlbum(id: Int){

        do{
            let realm = try Realm()
            try realm.write{
                let deleteAlbum = realm.objects(Album.self).filter("id == \(id)")
                for song in deleteAlbum[0].songs{
                    realm.delete(song)
                }
                realm.delete(deleteAlbum)
            }
        } catch let error as NSError{
            print(error)
        }
    }

    func getSongAuthor(id: Int)-> List<Song>{
        do{
            let realm = try Realm()
        let author = realm.objects(Author.self).filter("id == \(id)")
        let songs = author[0].songs
        return songs
        }catch{
            
        }
        return List<Song>()
    }

    func getSongAlbum(id:Int)-> List<Song>{
        do{
            let realm = try Realm()
        let album = realm.objects(Album.self).filter("id == \(id)")
        let songs = album[0].songs
        return songs
        }catch{
            
        }
        return List<Song>()
    }
    

    func getAuthorSong(id:Int)->Author{
        do{
            let realm = try Realm()
        let song = realm.objects(Song.self).filter("id == \(id)")
        let author = song[0].author[0]
        print(author)
        return author
        }catch{
            
        }
        return Author()
    }

    func getAulbomSong(id:Int)->Album?{
        do{
            let realm = try Realm()
        let song = realm.objects(Song.self).filter("id == \(id)")
        if song[0].albom.count != 0{
            let album = song[0].albom[0]
            print(album)
            return album
        }
        return nil
        }catch{
            
        }
        return nil
    }
    func getSong(id: Int)->Song{
        do{
            let realm = try Realm()
            let song = realm.objects(Song.self).filter("id == \(id)")
            return song[0]
        }catch{
            
        }
        return Song()
    }
    
    func getAuthor(id: Int)->Author{
        do{
            let realm = try Realm()
            let author = realm.objects(Author.self).filter("id == \(id)")
            return author[0]
        }catch{
            
        }
        return Author()
    }
    


    func getContAuthor()-> Int{
        do{
            let realm = try Realm()
        return realm.objects(Author.self).count
        }catch{
            
        }
        return 0
    }

    func getContAulbom()-> Int{
        do{
            let realm = try Realm()
        return realm.objects(Album.self).count
        }catch{
            
        }
        return 0
    }

    func getContSong()-> Int{
        do{
            let realm = try Realm()
        return realm.objects(Song.self).count
        }catch{
            
        }
        return 0
    }
    
    func addPlayList(playList: PlayListModel){
        do {
            let realm = try Realm()
            var lastid = realm.objects(PlayListModel.self).last?.id
            if lastid == nil{
                lastid = 0
            }else{
                lastid = lastid! + 1
            }
            playList.id  = lastid!
            try realm.write{
                realm.add(playList)
            }
        } catch let error as NSError {
            print(error)
        }
    }
    
    func deletePlayList(id: Int){
        do {
            let realm = try Realm()
            let deletePlayList = realm.objects(PlayListModel.self).filter("id == \(id)")
            try realm.write{
                realm.delete(deletePlayList)
            }
        } catch let error as NSError  {
            print(error)
        }
    }
    
    func getPlayList(id: Int)->PlayListModel{
        do {
            let realm = try Realm()
            let playList = realm.objects(PlayListModel.self).filter("id == \(id)")
            return playList[0]
        } catch let error as NSError {
            print(error)
        }
        return PlayListModel()
    }
    func getCountPlayList()->Int{
        do{
            let realm = try Realm()
            return realm.objects(PlayListModel.self).count
        }catch{
            
        }
        return 0
    }
    func getLastIdPlayList()-> Int{
        do {
            let realm = try Realm()
            var lastId = realm.objects(PlayListModel.self).last?.id
            if lastId == nil{
                lastId = 0
            }else{
                lastId = lastId!
            }
            return lastId!
        } catch let error as NSError {
            print(error)
        }
        return 0
    }
    
    func addPlayListSongs(idPlayList:Int, songs:[Song]){
        do {
            let realm = try Realm()
            let playList = realm.objects(PlayListModel.self).filter("id == \(idPlayList)")
            for song in songs{
                try realm.write{
                    playList[0].songs.append(song)
                }
            }
        } catch let error as NSError {
            print(error)
        }
    }
    
    func parsing(){
        let statbuf: Stat
        let json = MockJson()
        let inputData = json.mockJsonAuthorsList.data(using: .utf8)!
        let decoder = JSONDecoder()
        statbuf = try! decoder.decode(Stat.self, from: inputData)
        print(statbuf.author)
        self.add(authors: statbuf.author)

    }
    
    
    func add(authors:[AuthorModel]){
        var lastIdAuthor = 0
        var lastIdAulbom = 0
        do {
            let realm = try Realm()
            var lastid = realm.objects(Author.self).last?.id
            if lastid == nil{
                lastid = 0
                lastIdAuthor = lastid!
            }else{
                lastid = lastid! + 1
                lastIdAuthor = lastid!
            }
        } catch let error as NSError {
            print(error)
        }
        do {
            let realm = try Realm()
            var lastid = realm.objects(Album.self).last?.id
            if lastid == nil{
                lastid = 0
                lastIdAulbom = lastid!
            }else{
                lastid = lastid! + 1
                lastIdAulbom = lastid!
            }
        } catch let error as NSError {
            print(error)
        }
        for author in authors{
            self.addAuthor(author: author)
            for song in author.song!{
                self.addSong(IdAuthor: lastIdAuthor, IdAlbum: nil, song: song)
            }
            for aulbum in author.album!{
                self.addAlbum(album: aulbum, idAuthor: lastIdAuthor)
                for song in aulbum.song!{
                    self.addSong(IdAuthor: lastIdAuthor, IdAlbum: lastIdAulbom, song: song)
                }
                lastIdAulbom = lastIdAulbom + 1
            }
            lastIdAuthor = lastIdAuthor + 1
        }
    }
    
    func createDataBase(){
        let author = Author()
        author.name = "1"
        author.id = 0
        let albom = Album()
        albom.dateRealise = Date(timeIntervalSince1970: Date().timeIntervalSinceReferenceDate)
        albom.name = "1.1"
        albom.id = 0
        let albom1 = Album()
        albom1.dateRealise = Date(timeIntervalSince1970: Date().timeIntervalSinceReferenceDate)
        albom1.name = "1.2"
        albom1.id = 1
        let song = Song()
        song.name = "1.1.1"
        song.id = 0
        let song1 = Song()
        song1.name = "1.1.2"
        song1.id = 1
        let song2 = Song()
        song2.id = 2
        song2.name = "1.1.3"
        let song3 = Song()
        song3.id = 3
        song3.name = "1.1.4"
        let song1_1 = Song()
        song1_1.id = 4
        song1_1.name = "1.2.1"
        let song1_2 = Song()
        song1_2.id = 5
        song1_2.name = "1.2.2"
        let song1_3 = Song()
        song1_3.id = 6
        song1_3.name = "1.2.3"
        let song1_4 = Song()
        song1_4.id = 7
        song1_4.name = "1.2.4"

//

        //addAuthor(author: author)
        //addAlbum(album: albom, author: author)
        //addAlbum(album: albom1, author: author)
        //addSong(author: author, album: albom, song: song)
        //addSong(author: author, album: albom, song: song1)
        //addSong(author: author, album: albom, song: song2)
        //addSong(author: author, album: albom, song: song3)
        //addSong(author: author, album: albom1, song: song1_1)
        //addSong(author: author, album: albom1, song: song1_2)
        //addSong(author: author, album: albom1, song: song1_3)
        //addSong(author: author, album: albom1, song: song1_4)

    }
}
