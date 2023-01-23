//
//  PaymentTableViewCell.swift
//  ilmuOneData
//
//  Created by Rinaldi Alfian on 21/01/23.
//

import UIKit

class PaymentTableViewCell: UITableViewCell {

    @IBOutlet var paymentName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setupContents(_ model: PaymentList) {
        paymentName.text = model.name
    }
    
}

