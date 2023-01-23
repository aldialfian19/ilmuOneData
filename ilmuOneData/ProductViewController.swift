//
//  ProductViewController.swift
//  ilmuOneData
//
//  Created by Rinaldi Alfian on 21/01/23.
//

import UIKit
import Firebase

class ProductViewController: UIViewController {

    @IBOutlet var productCollectionView: UICollectionView!
    
    
    private var product: [ProductList] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTable()
        addData()
        
        Analytics.logEvent(AnalyticsEventViewItemList, parameters: nil)
        // Do any additional setup after loading the view.
    }
    func updateTable() {
        title = "Product"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        productCollectionView.dataSource = self
        productCollectionView.delegate = self
        productCollectionView.register(UINib(nibName: "ProductCellCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
    }
    
    func addData() {
        product = ProductList.getProductList()
        productCollectionView.reloadData()
    }
    
    

}

extension ProductViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.product.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? ProductCellCollectionViewCell {
            cell.setupContents(product[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(indexPath.row)")
//        let storyboard = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        Analytics.logEvent(AnalyticsEventSelectItem, parameters: nil)
        
        let vc = DetailViewController()
        vc.detailModel = product[indexPath.row]
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}
