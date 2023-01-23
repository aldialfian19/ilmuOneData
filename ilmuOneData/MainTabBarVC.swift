

import UIKit
import Firebase



class MainTabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        setupTabs()
    }

    private func setupTabs() {
        tabBar.tintColor = UIColor.blue
        
        let productVC = ProductViewController()
        let productTabBarItem = UITabBarItem(title: "Product", image: UIImage(systemName: "list.bullet"), selectedImage: UIImage(systemName: "list.bullet"))
        productVC.tabBarItem = productTabBarItem
        let productTabNavController = UINavigationController(rootViewController: productVC)
        productTabNavController.navigationBar.tintColor = .blue

        let cartVC = CartViewController()
        let cartTabBarItem = UITabBarItem(title: "My Cart", image: UIImage(systemName: "cart.fill"), selectedImage: UIImage(systemName: "cart.fill"))
        cartVC.tabBarItem = cartTabBarItem
        let cartTabNavController = UINavigationController(rootViewController: cartVC)
        cartTabNavController.navigationBar.tintColor = .blue
        
        let wishlistVC = WishlistViewController()
        let wishlistTabBarItem = UITabBarItem(title: "Wishlist", image: UIImage(systemName: "heart.fill"), selectedImage: UIImage(systemName: "heart.fill"))
        wishlistVC.tabBarItem = wishlistTabBarItem
        let wishlistTabNavController = UINavigationController(rootViewController: wishlistVC)
        wishlistTabNavController.navigationBar.tintColor = .blue
        

        
        viewControllers = [productTabNavController, cartTabNavController, wishlistTabNavController]
    }
}

extension MainTabBarVC: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
    }
}
