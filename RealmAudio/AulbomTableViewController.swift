//
//  AulbomTableViewController.swift
//  RealmAudio
//
//  Created by Юрий Дубровин on 29.01.2021.
//

import UIKit
import RealmSwift

class AulbomTableViewController: UITableViewController {
    let realm = try! Realm()
    var Autorid: Int = 1
    let dataBaseManager = DBManagerRealm()
    override func viewDidLoad() {
        super.viewDidLoad()
        let buf = realm.objects(Autor.self).filter("id == \(self.Autorid)")
        for i in buf[0].alboms{
            print(i)
        }
        print(Autorid)
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let buf = realm.objects(Autor.self).filter("id == \(self.Autorid)")
        return buf[0].alboms.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AulbomCell", for: indexPath)

        let buf = realm.objects(Autor.self).filter("id == \(self.Autorid)")
        cell.textLabel?.text = buf[0].alboms[indexPath.row].name
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "moveToSongViewController"{
            let destinationVC  = segue.destination as! SongTableViewController
            destinationVC.Albomid = self.Autorid
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.Autorid = indexPath.row
        self.performSegue(withIdentifier: "moveToSongViewController", sender: self)
    }
}
