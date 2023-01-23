//
//  ProductModel.swift
//  ilmuOneData
//
//  Created by Rinaldi Alfian on 20/01/23.
//

import Foundation
import Firebase


struct ProductList {
    var image: String
    var name: String
    var price: String
    
    init(image: String, name: String, price: String) {
        self.image = image
        self.name = name
        self.price = price
    }
    
}


extension ProductList {
    static func getProductList() -> [ProductList] {
        [
            ProductList(image: "product1", name: "Product Clothes 1", price: "120rb"),
            ProductList(image: "product2", name: "Product Clothes 2", price: "122rb"),
            ProductList(image: "product3", name: "Product Clothes 3", price: "130rb"),
            ProductList(image: "product4", name: "Product Clothes 4", price: "118rb"),
            ProductList(image: "product5", name: "Product Clothes 5", price: "116rb"),
            ProductList(image: "product6", name: "Product Clothes 6", price: "121rb"),
            ProductList(image: "product7", name: "Product Clothes 7", price: "131rb"),
            ProductList(image: "product8", name: "Product Clothes 8", price: "112rb"),
            ProductList(image: "product9", name: "Product Clothes 9", price: "121rb"),
            ProductList(image: "product10", name: "Product Clothes 10", price: "108rb"),
            ProductList(image: "product11", name: "Product Clothes 11", price: "110rb"),
        ]
    }
}

struct PaymentList {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
}


extension PaymentList {
    static func getPaymentList() -> [PaymentList] {
        [
            PaymentList(name: "Transfer Bank"),
            PaymentList(name: "Cash On Delivery"),
            PaymentList(name: "Gratis")
        ]
    }
}

struct WishList {
    var image: String
    var name: String
    var price: String
    
    
    init(image: String, name: String, price: String) {
        self.image = image
        self.name = name
        self.price = price
    }
    
}


extension WishList {
    static func getWishList() -> [WishList] {
        [
            WishList(image: "product3", name: "Product Clothes 3", price: "130rb"),
            WishList(image: "product6", name: "Product Clothes 6", price: "121rb"),
            WishList(image: "product8", name: "Product Clothes 8", price: "112rb"),
            WishList(image: "product10", name: "Product Clothes 10", price: "108rb"),
        ]
    }
}

struct CartList {
    var image: String
    var name: String
    var price: String
    
    
    init(image: String, name: String, price: String) {
        self.image = image
        self.name = name
        self.price = price
    }
    
}


extension CartList {
    static func getCartList() -> [CartList] {
        [
            CartList(image: "product1", name: "Product Clothes 1", price: "120rb"),
            CartList(image: "product2", name: "Product Clothes 2", price: "122rb"),
            CartList(image: "product7", name: "Product Clothes 7", price: "131rb"),
            CartList(image: "product8", name: "Product Clothes 8", price: "112rb"),
            CartList(image: "product9", name: "Product Clothes 9", price: "121rb"),
        ]
    }
}
