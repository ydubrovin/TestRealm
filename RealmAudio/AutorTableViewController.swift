//
//  AutorTableViewController.swift
//  RealmAudio
//
//  Created by Юрий Дубровин on 29.01.2021.
//

import UIKit
import RealmSwift

class AutorTableViewController: UITableViewController {
    let dataBaseManager = DBManagerRealm()
    var Authorid = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.dataBaseManager = DBManagerRealm()
        //DB.createDataBase()
         //let buf = realm.objects(Song.self).last
        ///print(buf?.id)
        
//        try! realm.write{
//            realm.deleteAll()
//        }
       // createDataBase()
//        let buf = DB.getAulbomSong(id: 6)
//        let song = realm.objects(Song.self).filter("id == 7")
//        if song[0].albom.count == 0{
//            print("es")
//        }
//        print(buf!.name)
        //DB.deleteAuthor(id: 0)
        //DB.getSong()
    }

    // MARK: - Table view data source



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0 //dataBaseManager.getContAuthor()
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AutorCell", for: indexPath)
        //let author = self.dataBaseManager.getAuthorSong(id: indexPath.row)
        cell.textLabel?.text = ""//author.name
         

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "moveToAlbumViewController"{
            let destinationVC  = segue.destination as! AulbomTableViewController
            destinationVC.Authorid = self.Authorid
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.Authorid = indexPath.row
        self.performSegue(withIdentifier: "moveToAlbumViewController", sender: self)
    }
}
