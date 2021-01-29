//
//  SongTableViewController.swift
//  RealmAudio
//
//  Created by Юрий Дубровин on 29.01.2021.
//

import UIKit
import RealmSwift

class SongTableViewController: UITableViewController {
    var id = 0
    
    let realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - Table view data source



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let buf = realm.objects(Albom.self).filter("id == \(self.id)")
        return buf[0].songs.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2", for: indexPath)

        let buf = realm.objects(Albom.self).filter("id == \(self.id)")
        print(buf[0].songs)
        cell.textLabel?.text = buf[0].songs[indexPath.row].name

        return cell
    }
    @IBAction func addSong(_ sender: Any) {
        print("sdsds")
        let buf = realm.objects(Albom.self).filter("id == \(self.id)")
        var song = Song()
        song.id = 8
        song.name = "1.1.5"
                try! realm.write{
                    realm.add(song)
                    buf[0].songs.append(song)
                }
        
    }
    func deleteSong(){
        let buf = realm.objects(Song.self).filter("id == 8")
                try! realm.write{
                    realm.delete(buf)
                }
    }
}
