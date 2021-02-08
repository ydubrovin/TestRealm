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
    }

    // MARK: - Table view data source



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DBManagerRealm.sharedManager.getContAuthor()
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AutorCell", for: indexPath)
        let author = DBManagerRealm.sharedManager.getAuthor(id: indexPath.row)
        cell.textLabel?.text = author.name
         

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
