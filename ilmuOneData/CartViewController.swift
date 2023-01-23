//
//  CartViewController.swift
//  ilmuOneData
//
//  Created by Rinaldi Alfian on 20/01/23.
//

import UIKit
import Firebase

class CartViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    private var cart: [CartList] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
        addData()
        
        Analytics.logEvent(AnalyticsEventViewCart, parameters: nil)

    }
    func setupTable(){
        title = "My Cart"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let nib = UINib(nibName: "CartTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cellCart")
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.layer.cornerRadius = 10
        
    }
    
    func addData() {
        cart = CartList.getCartList()
        tableView.reloadData()
    }

}
extension CartViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return self.cart.count
        }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cellCart")! as? CartTableViewCell {
            cell.setupContents(cart[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
}

