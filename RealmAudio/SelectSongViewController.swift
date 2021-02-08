//
//  SelectSongViewController.swift
//  RealmAudio
//
//  Created by Юрий Дубровин on 05.02.2021.
//

import UIKit

class SelectSongViewController: UIViewController {
    @IBOutlet weak var songTableView: UITableView!
    var songs: [Song]?
    var idPlayList: Int = 0 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.songTableView.delegate = self
        songTableView.register(UINib(nibName: "CheckSongTableViewCell", bundle: nil), forCellReuseIdentifier: "SongCells")
        self.songs = [Song]()
    }
    @IBAction func addSong(_ sender: Any) {
        DBManagerRealm.sharedManager.addPlayListSongs(idPlayList: self.idPlayList, songs: self.songs!)

    }
    

}
extension SelectSongViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DBManagerRealm.sharedManager.getContSong()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongCells", for: indexPath) as! CheckSongTableViewCell

        cell.nameSong.text = DBManagerRealm.sharedManager.getSong(id: indexPath.row).name
        cell.checkImage.isHidden = true
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)as! CheckSongTableViewCell
        if cell.checkImage.isHidden == true{
            cell.checkImage.isHidden = false
            self.songs?.append(DBManagerRealm.sharedManager.getSong(id: indexPath.row))
        }else{
            cell.checkImage.isHidden = true
            var idDelete = 0
            for i in 0...songs!.count-1{
                if cell.nameSong.text == self.songs![i].name{
                    idDelete = i
                }
            }
            self.songs?.remove(at: idDelete)
        }
    }
    
    
}
