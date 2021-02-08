//
//  CheckSongTableViewCell.swift
//  RealmAudio
//
//  Created by Юрий Дубровин on 06.02.2021.
//

import UIKit

class CheckSongTableViewCell: UITableViewCell {
    @IBOutlet weak var nameSong: UILabel!
    @IBOutlet weak var checkImage: UIImageView!
    
    static func nib() -> UINib{
        return UINib(nibName: "SongCell", bundle: nil)
    }
    
    func create(){
        self.nameSong = UILabel()
        self.checkImage = UIImageView()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
