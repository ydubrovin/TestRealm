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
    

}

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
    
    
}


