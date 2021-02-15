//
//  AddSongViewController.swift
//  RealmAudio
//
//  Created by Юрий Дубровин on 14.02.2021.
//

import UIKit

class AddSongViewController: UIViewController {
    @IBOutlet weak var AddSongTableView: UITableView!
    var songs:[SongModel]?
    var idPlayList = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.AddSongTableView.delegate = self
        self.songs = [SongModel]()
        self.songs = DBManagerRealm.sharedManager.getAllSongs()
        let curentPlaylist = DBManagerRealm.sharedManager.getPlayList(id: self.idPlayList)
        print(curentPlaylist.name)
        let curentPlaylistSongs = curentPlaylist.songs
        for curentPlaylistSong in curentPlaylistSongs{
            if let index = self.songs!.firstIndex(where: {$0.id == curentPlaylistSong.id}){
                self.songs!.remove(at: index)
            }
        }
    }
    

 

}

// MARK: - Table view data source and delegate

extension AddSongViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.songs!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongCell", for: indexPath)

        cell.textLabel?.text = self.songs![indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let songModel = Song()
        songModel.id = self.songs![indexPath.row].id
        songModel.name = self.songs![indexPath.row].name
        DBManagerRealm.sharedManager.addPlayListSong(idPlayList: self.idPlayList, songs: songModel)
        self.songs!.remove(at: indexPath.row)
        tableView.beginUpdates()
        tableView.deleteRows(at: [indexPath], with: .fade)
        
        tableView.endUpdates()
    }
    
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    
}
