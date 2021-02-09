//
//  SongTableViewController.swift
//  RealmAudio
//
//  Created by Юрий Дубровин on 29.01.2021.
//

import UIKit
import RealmSwift

class SongTableViewController: UITableViewController {
    var Albomid = 1
    let dataBaseManager = DBManagerRealm()
    
    let realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - Table view data source



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let songAlbum = dataBaseManager.getSongAlbum(id: self.Albomid)
        return songAlbum.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongCell", for: indexPath)

        let buf = realm.objects(Album.self).filter("id == \(self.Albomid)")
        print(buf[0].songs)
        let songAlbum = dataBaseManager.getSongAlbum(id: self.Albomid)
        cell.textLabel?.text = songAlbum[indexPath.row].name

        return cell
    }
}
