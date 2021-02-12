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
    var selectIds:[Int]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.songTableView.delegate = self
        songTableView.register(UINib(nibName: "CheckSongTableViewCell", bundle: nil), forCellReuseIdentifier: "SongCells")
        self.songs = [Song]()
        self.selectIds = [Int]()
    }
    @IBAction func addSong(_ sender: Any) {
        DBManagerRealm.sharedManager.addPlayListSongs(idPlayList: self.idPlayList, songs: self.songs!)
        performSegue(withIdentifier: "SelectSongToPlaylist", sender: self)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SelectSongToPlaylist"{
        }
    }
    
    @IBAction func goToBack(_ sender: Any) {
        let i = 1
        if i == 1{
            navigationController?.popViewController(animated: false)
            print(false)
        }
    }
    
}
extension SelectSongViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DBManagerRealm.sharedManager.getContSong()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongCells", for: indexPath) as! CheckSongTableViewCell
        let namesong = DBManagerRealm.sharedManager.getSong(id: indexPath.row).name
        cell.nameSong.text = DBManagerRealm.sharedManager.getSong(id: indexPath.row).name
        cell.checkImage.isHidden = true
        cell.tag = 0
        cell.id = indexPath.row
        if self.selectIds?.count == 0{
            cell.checkImage.isHidden = true
        }else{
            print(indexPath.row)
            for id in self.selectIds!{
                if id == indexPath.row{
                    print("true")
                    cell.checkImage.isHidden = false
                }else{
                }
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)as! CheckSongTableViewCell
        if cell.checkImage.isHidden == true{
            cell.checkImage.isHidden = false
            self.songs?.append(DBManagerRealm.sharedManager.getSong(id: indexPath.row))
            self.selectIds?.append(indexPath.row)
            cell.tag = 1
        }else{
            cell.checkImage.isHidden = true
            var idDelete = 0
            for i in 0...songs!.count-1{
                if cell.nameSong.text == self.songs![i].name{
                    idDelete = i
                }
            }
            var idsDelete = 0
            print(indexPath.row)
            for i in 0...self.selectIds!.count-1{
                if indexPath.row == self.selectIds![i]{
                    idsDelete = i
                }
            }
            self.songs?.remove(at: idDelete)
            self.selectIds?.remove(at: idsDelete)
            cell.tag = 0
        }
        print(self.selectIds)
    }
    
    
}
