//
//  ProductCellCollectionViewCell.swift
//  ilmuOneData
//
//  Created by Rinaldi Alfian on 20/01/23.
//

import UIKit

class ProductCellCollectionViewCell: UICollectionViewCell {

    @IBOutlet var viewCell: UIView!
    @IBOutlet var imageCell: UIImageView!
    @IBOutlet var productName: UILabel!
    @IBOutlet var productPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    private func setupUI() {
        viewCell.applyCardView()
    }
    
    func setupContents(_ model: ProductList) {
        imageCell.image = UIImage(named: model.image)
        productName.text = model.name
        productPrice.text = model.price
    }

}
