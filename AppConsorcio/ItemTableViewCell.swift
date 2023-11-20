//
//  ItemTableViewCell.swift
//  AppConsorcio
//
//  Created by DAMII on 22/10/23.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    @IBOutlet weak var lblNombres: UILabel!
    @IBOutlet weak var lblApellidos: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
