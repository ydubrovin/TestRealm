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
    var Authorid: Int = 1
    let dataBaseManager = DBManagerRealm()
    var idAlboms = [Int]()
    override func viewDidLoad() {
        super.viewDidLoad()
        let author = realm.objects(Author.self).filter("id == \(self.Authorid)")
        for i in author[0].alboms{
            print(i)
        }
        print(Authorid)
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let countAuthors = realm.objects(Author.self).filter("id == \(self.Authorid)")
        return countAuthors[0].alboms.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AulbomCell", for: indexPath)

        let buf = realm.objects(Author.self).filter("id == \(self.Authorid)")
        cell.textLabel?.text = buf[0].alboms[indexPath.row].name
        let id = buf[0].alboms[indexPath.row].id
        idAlboms.append(id)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "moveToSongViewController"{
            let destinationVC  = segue.destination as! SongTableViewController
            
            destinationVC.Albomid = self.Authorid
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //self.Authorid = indexPath.row
        print(idAlboms[indexPath.row])
        self.Authorid = idAlboms[indexPath.row]
        self.performSegue(withIdentifier: "moveToSongViewController", sender: self)
    }
}
