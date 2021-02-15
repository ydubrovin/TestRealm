//
//  PlaylistSongsViewController.swift
//  RealmAudio
//
//  Created by Юрий Дубровин on 11.02.2021.
//

import UIKit

class PlaylistSongsViewController: UIViewController {
    @IBOutlet weak var songsTableView: UITableView!
    var idPlaylist = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        songsTableView.delegate = self

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        songsTableView.reloadData()
    }
    @IBAction func gotoAddSongs(_ sender: Any) {
        self.performSegue(withIdentifier: "SongsPlayListToAddSong", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SongsPlayListToAddSong"{
            let destinationVC  = segue.destination as! AddSongViewController
            destinationVC.idPlayList = self.idPlaylist
        }
    }
    

}
// MARK: - Table view data source and delegate
extension PlaylistSongsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let countSongPlayList = DBManagerRealm.sharedManager.getPlayList(id: idPlaylist).songs.count
        return countSongPlayList
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongCell", for: indexPath)

        let playList = DBManagerRealm.sharedManager.getPlayList(id: idPlaylist)
        cell.textLabel?.text = playList.songs[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            DBManagerRealm.sharedManager.deleteSongPlayList(idPlayList: self.idPlaylist, idSong: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    
}


