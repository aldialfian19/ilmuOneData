//
//  OrderViewController.swift
//  ilmuOneData
//
//  Created by Rinaldi Alfian on 20/01/23.
//

import UIKit
import Firebase
import FirebaseAuth

class OrderViewController: UIViewController {

    @IBOutlet var orderImage: UIImageView!
    @IBOutlet var orderName: UILabel!
    @IBOutlet var orderPrice: UILabel!
    
    @IBOutlet var paymentTableView: UITableView!
    @IBOutlet var paymentButton: UIButton!
    
    var detailOrder: ProductList?
    private var cart: [PaymentList] = []
    let payment = ["Transfer Bank", "Minimart", "Dompet Digital", "Cash On Delivery"]
    
    var refOrder: DatabaseReference!
    let userID = Auth.auth().currentUser?.uid
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTable()
        addData()
        updateOrder()
        
        self.hideKeyboardWhenTappedAround()
        
        Analytics.logEvent(AnalyticsEventBeginCheckout, parameters: nil)
        
        refOrder = Database.database().reference().child(userID!).child("order");
        // Do any additional setup after loading the view.
    }
    func updateTable() {
        title = "Order"
        navigationController?.navigationBar.prefersLargeTitles = true
        paymentTableView.dataSource = self
        paymentTableView.delegate = self
        paymentTableView.register(UINib(nibName: "PaymentTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
    }
    func addData() {
        cart = PaymentList.getPaymentList()
        paymentTableView.reloadData()
    }
    func updateOrder() {
        // masukkan atribut detail
        orderImage.image = UIImage(named: detailOrder?.image ?? "")
        orderName.text = detailOrder?.name
        orderPrice.text = detailOrder?.price
    }
    
    func addOrder() {
//        let key = refCart.childByAutoId().key
        
        let order = ["id":userID,
                    "cartName": orderName.text! as String,
                    "cartPrice": orderPrice.text! as String,
                    "cartImage" : detailOrder!.image as String
        ]
        refOrder.setValue(order)
        
    }
    
    @IBAction func paymentAction(_ sender: Any) {
        Analytics.logEvent(AnalyticsEventAddPaymentInfo, parameters: nil)
        self.paymentTableView.isHidden = !self.paymentTableView.isHidden
    }
    
    @IBAction func orderAction(_ sender: Any) {
        
        addOrder()
        Analytics.logEvent(AnalyticsEventPurchase, parameters: nil)
        
        guard let window = UIApplication.shared.keyWindow else { return }
        let succesVC = SucccesViewController()
        UIView.transition(with: window, duration: 0.0, options: .transitionCrossDissolve, animations: { [weak window] in
            window?.rootViewController = succesVC
        }, completion: nil)
    }
    // test
    
}

extension OrderViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.payment.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell")! as? PaymentTableViewCell {
            cell.paymentName.text = self.payment[indexPath.row]
//            cell.setupContents(cart[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = payment[indexPath.row]
        
        paymentButton.setTitle(cell, for: .normal)
        self.paymentTableView.isHidden = true
    }
    
}
