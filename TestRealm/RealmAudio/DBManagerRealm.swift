//
//  FIleManagerBDRealm.swift
//  RealmAudio
//
//  Created by Юрий Дубровин on 31.01.2021.
//

import Foundation
import RealmSwift

class DBManagerRealm{
    fileprivate let realm = try! Realm()
    
    func fileExists(){
        let path = Realm.Configuration.defaultConfiguration.fileURL?.path
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: path!){
            print("file exists")
        }else{
            self.createDataBase()
        }
    }
    
    func deleteAll(){
        self.realm.deleteAll()
    }
    
    func addAuthor(author: Autor){
        try! realm.write{
            realm.add(author)
        }
    }
    
    func addAlbum(album: Albom, author: Autor){
        try! realm.write{
            realm.add(album)
            author.alboms.append(album)
        }
    }
    
    func addSong(author: Autor, album: Albom?,song:Song ){
        try! realm.write{
            realm.add(song)
            author.songs.append(song)
            if album != nil{
                album?.songs.append(song)
            }
        }
    }
    
    func deleteAuthor(id: Int){
        let deleteAuthor = realm.objects(Autor.self).filter("id == \(id)")
        try! realm.write{
            for deleteSong in deleteAuthor[0].songs{
                realm.delete(deleteSong)
            }
            for deleteAulbum in deleteAuthor[0].alboms{
                realm.delete(deleteAulbum)
            }
            realm.delete(deleteAuthor)
        }
    }
    
    func deleteSong(id: Int){
        let deleteSong = realm.objects(Song.self).filter("id == \(id)")
        try! realm.write{
            realm.delete(deleteSong)
        }
    }
    
    func deleteAlbum(id: Int){
        let deleteAlbum = realm.objects(Albom.self).filter("id == \(id)")
        try! realm.write{
            for song in deleteAlbum[0].songs{
                realm.delete(song)
            }
            realm.delete(deleteAlbum)
        }
    }
    
    func getSongAuthor(id: Int)-> List<Song>{
        let author = realm.objects(Autor.self).filter("id == \(id)")
        let songs = author[0].songs
        return songs
    }
    
    func getSongAlbum(id:Int)-> List<Song>{
        let album = realm.objects(Albom.self).filter("id == \(id)")
        let songs = album[0].songs
        return songs
    }
    
    func getAuthorSong(id:Int)->Autor{
        let song = realm.objects(Song.self).filter("id == \(id)")
        let author = song[0].author[0]
        print(author)
        return author
    }
    
    func getAulbomSong(id:Int)->Albom?{
        let song = realm.objects(Song.self).filter("id == \(id)")
        if song[0].albom.count != 0{
            let album = song[0].albom[0]
            print(album)
            return album
        }
        return nil
    }
    
    func createDataBase(){
        let author = Autor()
        author.name = "1"
        author.id = 0
        let albom = Albom()
        albom.dateRealise = Date(timeIntervalSince1970: Date().timeIntervalSinceReferenceDate)
        albom.name = "1.1"
        albom.id = 0
        let albom1 = Albom()
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
        let DB = DBManagerRealm()
        DB.addAuthor(author: author)
        DB.addAlbum(album: albom, author: author)
        DB.addAlbum(album: albom1, author: author)
        DB.addSong(author: author, album: albom, song: song)
        DB.addSong(author: author, album: albom, song: song1)
        DB.addSong(author: author, album: albom, song: song2)
        DB.addSong(author: author, album: albom, song: song3)
        DB.addSong(author: author, album: albom1, song: song1_1)
        DB.addSong(author: author, album: albom1, song: song1_2)
        DB.addSong(author: author, album: albom1, song: song1_3)
        DB.addSong(author: author, album: albom1, song: song1_4)
        
    }
    
}
