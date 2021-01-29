//
//  AutorTableViewController.swift
//  RealmAudio
//
//  Created by Юрий Дубровин on 29.01.2021.
//

import UIKit
import RealmSwift

class AutorTableViewController: UITableViewController {
    let realm = try! Realm()
    var id = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        //createDataBase()
    }

    // MARK: - Table view data source



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let buf = realm.objects(Autor.self)
        return buf.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let buf = realm.objects(Autor.self)
        cell.textLabel?.text = buf[indexPath.row].name
         

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "one"{
            let destinationVC  = segue.destination as! AulbomTableViewController
            destinationVC.id = self.id
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.id = indexPath.row
        self.performSegue(withIdentifier: "one", sender: self)
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

        try! realm.write{
            realm.add(author)
            realm.add(albom)
            realm.add(albom1)
            author.alboms.append(albom)
            author.alboms.append(albom1)
            realm.add(song)
            realm.add(song1)
            realm.add(song2)
            realm.add(song3)
            author.alboms.first?.songs.append(song)
            author.alboms.first?.songs.append(song1)
            author.alboms.first?.songs.append(song2)
            author.alboms.first?.songs.append(song3)
            realm.add(song1_1)
            realm.add(song1_2)
            realm.add(song1_3)
            realm.add(song1_4)
            author.alboms.last?.songs.append(song1_1)
            author.alboms.last?.songs.append(song1_2)
            author.alboms.last?.songs.append(song1_3)
            author.alboms.last?.songs.append(song1_4)
        }
    }
}
