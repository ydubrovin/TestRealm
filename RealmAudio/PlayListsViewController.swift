//
//  PlayListsViewController.swift
//  RealmAudio
//
//  Created by Юрий Дубровин on 05.02.2021.
//

import UIKit

class PlayListsViewController: UIViewController {
    @IBOutlet weak var playListTableView: UITableView!
    var db: DBManagerRealm?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.playListTableView.delegate = self
        self.db = DBManagerRealm()
        // Do any additional setup after loading the view.
    }
    @IBAction func CreatePlayList(_ sender: Any) {
        self.performSegue(withIdentifier: "moveToCreatePlayList", sender: self)
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

extension PlayListsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return db?.getCountPlayList() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayListCell", for: indexPath)

        let buf = db?.getPlayList(id: indexPath.row)
        print(buf?.name)
        cell.textLabel?.text = buf?.name

        return cell
    }
    
    
}



