//
//  ItemMedicamentoTableViewCell.swift
//  AppConsorcio
//
//  Created by DAMII on 5/11/23.
//

import UIKit

class ItemMedicamentoTableViewCell: UITableViewCell {

    @IBOutlet weak var lblMedicamento: UILabel!
    @IBOutlet weak var lblStock: UILabel!
    @IBOutlet weak var lblPrecio: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
