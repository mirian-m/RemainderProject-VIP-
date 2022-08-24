//
//  RemaindetTableViewCell.swift
//  MirianMAglakelidze#24
//
//  Created by Admin on 8/24/22.
//

import UIKit

class RemaindetTableViewCell: UITableViewCell {

    @IBOutlet weak var remainderTitle: UILabel!
    @IBOutlet weak var remainderInfoLb: UILabel!
    @IBOutlet weak var date: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(remainderData: RemainderForm) {
        self.remainderTitle.text = remainderData.title.uppercased()
        self.remainderInfoLb.text = remainderData.info
        self.date.text = "\(remainderData.date)"
    }
}
