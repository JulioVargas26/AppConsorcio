//
//  ItemEmpleadoTableViewCell.swift
//  AppConsorcio
//
//  Created by DAMII on 19/11/23.
//

import UIKit

class ItemEmpleadoTableViewCell: UITableViewCell {

    @IBOutlet weak var lblApellidos: UILabel!
    @IBOutlet weak var lblNombres: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
