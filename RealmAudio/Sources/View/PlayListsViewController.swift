//
//  PlayListsViewController.swift
//  RealmAudio
//
//  Created by Юрий Дубровин on 05.02.2021.
//

import UIKit

class PlayListsViewController: UIViewController {
    @IBOutlet weak var playListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.playListTableView.delegate = self
    }
    
    @IBAction func CreatePlayList(_ sender: Any) {
        self.performSegue(withIdentifier: "moveToCreatePlayList", sender: self)
    }

}

extension PlayListsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DBManagerRealm.sharedManager.getCountPlayList()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayListCell", for: indexPath)

        let playList = DBManagerRealm.sharedManager.getPlayList(id: indexPath.row)
        cell.textLabel?.text = playList.name

        return cell
    }
    
    
}



