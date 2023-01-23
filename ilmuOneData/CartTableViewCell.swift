//
//  CartTableViewCell.swift
//  ilmuOneData
//
//  Created by Rinaldi Alfian on 20/01/23.
//

import UIKit

class CartTableViewCell: UITableViewCell {

    @IBOutlet var cartViewCell: UIView!
    @IBOutlet var cartImage: UIImageView!
    @IBOutlet var cartName: UILabel!
    @IBOutlet var cartPrice: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    private func setupUI() {
        cartViewCell.applyCardView()
    }
    
    func setupContents(_ model: CartList) {
        cartImage.image = UIImage(named: model.image)
        cartName.text = model.name
        cartPrice.text = model.price
    }
    
    func setupWish(_ model: WishList) {
        cartImage.image = UIImage(named: model.image)
        cartName.text = model.name
        cartPrice.text = model.price
    }
    
}
