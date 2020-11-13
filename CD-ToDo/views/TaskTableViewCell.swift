//
//  TaskTableViewCell.swift
//  CD-ToDo
//
//  Created by Leonardo Viana on 12/11/20.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func fillCellWithTitle(_ title: String?){
        titleLabel.text = title
    }
}
