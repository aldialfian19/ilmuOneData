//
//  ViewExtension.swift
//  ilmuOneData
//
//  Created by Rinaldi Alfian on 20/01/23.
//

import UIKit

extension UIView {
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        } set {
            self.layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var maskToBounds: Bool {
        get {
            return self.layer.masksToBounds
        } set {
            self.layer.masksToBounds = newValue
        }
    }
    
    func applyCardView(cornerRadius: CGFloat = 10, shadowOffsetWidth: Int = 1, shadowOffsetHeight: Int = 1, shadowColor: UIColor = UIColor.lightGray, shadowOpacity: Float = 0.5) {
        layer.cornerRadius = cornerRadius
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight)
        layer.shadowRadius = 4.0
        layer.shadowOpacity = shadowOpacity
        layer.masksToBounds = false
    }
    
    func roundEachCorners(corners: CACornerMask, radius: CGFloat) {
        layer.maskedCorners = corners
        layer.cornerRadius = radius
    }
}

