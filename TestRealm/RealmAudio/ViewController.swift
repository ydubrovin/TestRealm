//
//  ViewController.swift
//  RealmAudio
//
//  Created by Юрий Дубровин on 23.01.2021.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    //let realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()
        print(Realm.Configuration.defaultConfiguration.fileURL!)
//        var author = Autor()
//        author.name = "1"
//        author.id = 0
//        var albom = Albom()
//        albom.dateRealise = Date(timeIntervalSince1970: Date().timeIntervalSinceReferenceDate)
//        albom.name = "1.1"
//        albom.id = 0
//        //albom.owners = author
//        var albom1 = Albom()
//        albom1.dateRealise = Date(timeIntervalSince1970: Date().timeIntervalSinceReferenceDate)
//        albom1.name = "1.2"
//        albom1.id = 1
//        //albom1.owner = author
//        var song = Song()
//        song.name = "1.1.1"
//        song.id = 0
//        //song.owner = albom
//        var song1 = Song()
//        song1.name = "1.1.2"
//        song1.id = 1
//        //song1.owner = albom
//        var song2 = Song()
//        song2.id = 2
//        song2.name = "1.1.3"
//        //song2.owner = albom
//        var song3 = Song()
//        song3.id = 3
//        song3.name = "1.1.4"
//        //song3.owner = albom
//        //
//        var song1_1 = Song()
//        song1_1.id = 4
//        song1_1.name = "1.2.1"
//        //song1_1.owner = albom1
//        var song1_2 = Song()
//        song1_2.id = 5
//        song1_2.name = "1.2.2"
//        //song1_2.owner = albom1
//        var song1_3 = Song()
//        song1_3.id = 6
//        song1_3.name = "1.2.3"
//        //song1_3.owner = albom1
//        var song1_4 = Song()
//        song1_4.id = 7
//        song1_4.name = "1.2.4"
//        //song1_4.owner = albom1
//
//        //let author = Autor(value: "1",)
////
//
////        try! realm.write{
////            realm.add(author)
////            realm.add(albom)
////            realm.add(albom1)
////            author.alboms.append(albom)
////            author.alboms.append(albom1)
////            realm.add(song)
////            realm.add(song1)
////            realm.add(song2)
////            realm.add(song3)
////            author.alboms.first?.songs.append(song)
////            author.alboms.first?.songs.append(song1)
////            author.alboms.first?.songs.append(song2)
////            author.alboms.first?.songs.append(song3)
////            realm.add(song1_1)
////            realm.add(song1_2)
////            realm.add(song1_3)
////            realm.add(song1_4)
////            author.alboms.last?.songs.append(song1_1)
////            author.alboms.last?.songs.append(song1_2)
////            author.alboms.last?.songs.append(song1_3)
////            author.alboms.last?.songs.append(song1_4)
////        }
//        let buf = realm.objects(Autor.self).filter("id == 0")
//        //print(buf[0].alboms)
//        for i in buf[0].alboms{
//            print(i)
//        }
   }


}

