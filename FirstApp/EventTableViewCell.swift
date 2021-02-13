//
//  EventTableViewCell.swift
//  FirstApp
//
//  Created by Sarah on 2/11/21.
//

import UIKit

class EventTableViewCell: UITableViewCell {
    @IBOutlet weak var startTimeLabel: UILabel!
    @IBOutlet weak var eventNameLabel: UILabel!
    @IBOutlet weak var eventTypeLabel: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
