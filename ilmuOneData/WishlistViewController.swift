//
//  WishlistViewController.swift
//  ilmuOneData
//
//  Created by Rinaldi Alfian on 21/01/23.
//

import UIKit
import Firebase

class WishlistViewController: UIViewController {

    @IBOutlet var wishlistTableView: UITableView!
    
    private var wish: [WishList] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
        addData()
        
        Analytics.logEvent("view_wishlist", parameters: nil)

    }
    func setupTable(){
        title = "Wishlist"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let nib = UINib(nibName: "CartTableViewCell", bundle: nil)
        wishlistTableView.register(nib, forCellReuseIdentifier: "cellCart")
        wishlistTableView.delegate = self
        wishlistTableView.dataSource = self
        
        wishlistTableView.layer.cornerRadius = 10
        
    }
    
    func addData() {
        wish = WishList.getWishList()
        wishlistTableView.reloadData()
    }

}
extension WishlistViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return self.wish.count
        }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cellCart")! as? CartTableViewCell {
            cell.setupWish(wish[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
}
