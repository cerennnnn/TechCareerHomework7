//
//  ToDoTableViewCell.swift
//  ToDoVIPER
//
//  Created by Ceren Güneş on 1.02.2023.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {

    @IBOutlet var toDoItem: UILabel!
    @IBOutlet var categoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
