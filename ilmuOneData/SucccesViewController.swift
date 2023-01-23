//
//  SucccesViewController.swift
//  ilmuOneData
//
//  Created by Rinaldi Alfian on 22/01/23.
//

import UIKit

class SucccesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func mainAction(_ sender: Any) {
        guard let window = UIApplication.shared.keyWindow else { return }
        let mainVC = MainTabBarVC()
        UIView.transition(with: window, duration: 0.0, options: .transitionCrossDissolve, animations: { [weak window] in
            window?.rootViewController = mainVC
        }, completion: nil)
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
