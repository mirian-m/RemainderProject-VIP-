//
//  DirectoryTableViewCell.swift
//  MirianMAglakelidze#24
//
//  Created by Admin on 8/23/22.
//

import UIKit

class DirectoryTableViewCell: UITableViewCell {
    @IBOutlet weak var fileNameLb: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    func configure(fileName: String) {
        self.fileNameLb.text = fileName
    }

}
