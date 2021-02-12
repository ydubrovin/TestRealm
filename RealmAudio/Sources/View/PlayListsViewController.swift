//
//  PlayListsViewController.swift
//  RealmAudio
//
//  Created by Юрий Дубровин on 05.02.2021.
//

import UIKit

class PlayListsViewController: UIViewController {
    @IBOutlet weak var playListTableView: UITableView!
    var idPlayList = 0
    var playLists:[PlayList]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.playListTableView.delegate = self
        playLists = DBManagerRealm.sharedManager.getPlayLists()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.playLists = nil
        self.playLists = DBManagerRealm.sharedManager.getPlayLists()
        self.playListTableView.reloadData()
    }
    
    @IBAction func CreatePlayList(_ sender: Any) {
        self.performSegue(withIdentifier: "moveToCreatePlayList", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PlaylistmovePlaylistSongs"{
            let destinationVC  = segue.destination as! PlaylistSongsViewController
            destinationVC.idPlaylist = self.idPlayList
        }
    }
    
    @IBAction func unwindToPlayList(_ sender: UIStoryboardSegue){
        
    }

}

extension PlayListsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return DBManagerRealm.sharedManager.getCountPlayList()
        if playLists == nil{
            return 0
        }else{
            return playLists!.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayListCell", for: indexPath)

        //let playList = DBManagerRealm.sharedManager.getPlayList(id: indexPath.row)
        cell.textLabel?.text = self.playLists![indexPath.row].name //playList.name

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.idPlayList = self.playLists![indexPath.row].id
        //self.idPlayList = indexPath.row
        self.performSegue(withIdentifier: "PlaylistmovePlaylistSongs", sender: self)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            //DBManagerRealm.sharedManager.deletePlayList(id: indexPath.row)
            DBManagerRealm.sharedManager.deletePlayList(id: self.playLists![indexPath.row].id)
            self.playLists!.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    
}





