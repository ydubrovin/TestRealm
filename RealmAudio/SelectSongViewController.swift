//
//  SelectSongViewController.swift
//  RealmAudio
//
//  Created by Юрий Дубровин on 05.02.2021.
//

import UIKit

class SelectSongViewController: UIViewController {
    @IBOutlet weak var songTableView: UITableView!
    var db: DBManagerRealm?
    var songs: [Song]?
    var idPlayList: Int = 0 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.songTableView.delegate = self
        self.db = DBManagerRealm()
        songTableView.register(UINib(nibName: "CheckSongTableViewCell", bundle: nil), forCellReuseIdentifier: "SongCells")
        self.songs = [Song]()
        //songTableView.register(CheckSongTableViewCell.nib(), forCellWithReuseIdentifier: "CheckSong")
        // Do any additional setup after loading the view.
    }
    @IBAction func addSong(_ sender: Any) {
        db?.addPlayListSongs(idPlayList: self.idPlayList, songs: self.songs!)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension SelectSongViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.db?.getContSong() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongCells", for: indexPath) as! CheckSongTableViewCell
        //let author = self.dataBaseManager.getAuthorSong(id: indexPath.row)
        //cell.textLabel?.text = self.db?.getSong(id: indexPath.row).name
        //cell.create()
        cell.nameSong.text = self.db?.getSong(id: indexPath.row).name
        cell.checkImage.isHidden = true
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)as! CheckSongTableViewCell
        if cell.checkImage.isHidden == true{
            print(cell.nameSong.text)
            cell.checkImage.isHidden = false
            self.songs?.append((db?.getSong(id: indexPath.row))!)
            print(self.songs)
        }else{
            cell.checkImage.isHidden = true
            var idDelete = 0
            for i in 0...songs!.count-1{
                if cell.nameSong.text == self.songs![i].name{
                    idDelete = i
                }
            }
            self.songs?.remove(at: idDelete)
            print(self.songs)
        }
    }
    
    
}
