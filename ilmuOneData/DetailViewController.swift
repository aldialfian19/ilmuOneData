//
//  DetailViewController.swift
//  ilmuOneData
//
//  Created by Rinaldi Alfian on 20/01/23.
//

import UIKit
import Firebase
import FirebaseAuth

class DetailViewController: UIViewController {

    @IBOutlet var detailView: UIView!
    @IBOutlet var detailImage: UIImageView!
    @IBOutlet var detailName: UILabel!
    @IBOutlet var detailPrice: UILabel!
    
    var refCart: DatabaseReference!
    var refWish: DatabaseReference!
    
    var detailModel: ProductList?
    
    let userID = Auth.auth().currentUser?.uid
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateDetail()
        
        Analytics.logEvent(AnalyticsEventViewItem, parameters: nil)

        refCart = Database.database().reference().child(userID!).child("cart");
        refWish = Database.database().reference().child(userID!).child("wish");
    }
    
    func addWishlist() {
        
//        let key = refWish.childByAutoId().key
        
        let wish = ["id": userID,
                    "wishName": detailName.text! as String,
                    "wishPrice": detailPrice.text! as String,
                    "wishImage" : detailModel!.image as String
        ]
        refWish.setValue(wish)
        
    }
    
    func addCart() {
//        let key = refCart.childByAutoId().key
        
        let cart = ["id":userID,
                    "cartName": detailName.text! as String,
                    "cartPrice": detailPrice.text! as String,
                    "cartImage" : detailModel!.image as String
        ]
        refCart.setValue(cart)
        
    }


    func updateDetail() {
        title = "Detail Product"
        navigationController?.navigationBar.prefersLargeTitles = true
        // masukkan atribut detail
        detailImage.image = UIImage(named: detailModel?.image ?? "")
        detailName.text = detailModel?.name
        detailPrice.text = detailModel?.price
        
    }
    
    @IBAction func OrderAction(_ sender: Any) {
        let vc = OrderViewController()
        vc.detailOrder = detailModel
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func cartAction(_ sender: Any) {
        addCart()
        Analytics.logEvent(AnalyticsEventAddToCart, parameters: nil)
        
        guard let window = UIApplication.shared.keyWindow else { return }
        let mainVC = MainTabBarVC()
        UIView.transition(with: window, duration: 0.0, options: .transitionCrossDissolve, animations: { [weak window] in
            window?.rootViewController = mainVC
        }, completion: nil)
        
//
    }
    
    
    @IBAction func wishListAction(_ sender: Any) {
        Analytics.logEvent(AnalyticsEventAddToWishlist, parameters: nil)
        addWishlist()
//
    }
    
    
}
