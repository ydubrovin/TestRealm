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
    var id = 0
    
    static func nib() -> UINib{
        return UINib(nibName: "SongCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
}
