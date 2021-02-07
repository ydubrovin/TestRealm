//
//  CreatePlayListViewController.swift
//  RealmAudio
//
//  Created by Юрий Дубровин on 05.02.2021.
//

import UIKit

class CreatePlayListViewController: UIViewController {
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var namePlayListTextField: UITextField!
    @IBOutlet weak var CreatePlayListButton: UIButton!
    var bd: DBManagerRealm?
    var idPlayList: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bd = DBManagerRealm()
        self.idPlayList = bd?.getLastIdPlayList() ?? 0
        self.idPlayList = self.idPlayList + 1
        // Do any additional setup after loading the view.
    }
    
    @IBAction func CreatePlayList(_ sender: Any) {
        if namePlayListTextField.text != ""{
            let play = PlayListModel()
            play.name = namePlayListTextField.text!
            self.bd?.addPlayList(playList: play)
            print("ne pustaia")
            self.performSegue(withIdentifier: "moveToSelectSong", sender: self)
        }else{
            print("пустая сторока")
            createAlertController()
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "moveToSelectSong"{
            let destinationVC  = segue.destination as! SelectSongViewController
            destinationVC.idPlayList = self.idPlayList
        }
    }
    
    func createAlertController(){
        let action = UIAlertController(title: "Ошибка", message: "Неправильное имя", preferredStyle: .actionSheet)
        let okButton = UIAlertAction(title: "ok", style: .cancel, handler: nil)
        action.addAction(okButton)
        present(action, animated: true, completion: nil)
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
