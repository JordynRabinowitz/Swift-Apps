//
//  AssignmentTableViewCell.swift
//  Assignment Notebook
//
//  Created by Rabinowitz, Jordyn on 3/16/22.
//

import UIKit

class AssignmentTableViewCell: UITableViewCell {
    
    @IBOutlet weak var classLabel: UILabel!
    
    @IBOutlet weak var assignmentLabel: UILabel!
    
    @IBOutlet weak var dueLabel: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
