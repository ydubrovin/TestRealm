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
    var id: Int = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        let buf = realm.objects(Autor.self).filter("id == \(self.id)")
        //print(buf[0].alboms)
        for i in buf[0].alboms{
            print(i)
        }
        print(id)
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let buf = realm.objects(Autor.self).filter("id == \(self.id)")
        return buf[0].alboms.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath)

        let buf = realm.objects(Autor.self).filter("id == \(self.id)")
        cell.textLabel?.text = buf[0].alboms[indexPath.row].name
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "two"{
            let destinationVC  = segue.destination as! SongTableViewController
            destinationVC.id = self.id
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.id = indexPath.row
        self.performSegue(withIdentifier: "two", sender: self)
    }


}
