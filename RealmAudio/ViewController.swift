//
//  ViewController.swift
//  RealmAudio
//
//  Created by Юрий Дубровин on 23.01.2021.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print(Realm.Configuration.defaultConfiguration.fileURL!)
   }


}

