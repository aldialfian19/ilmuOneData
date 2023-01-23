//
//  RegisterViewController.swift
//  ilmuOneData
//
//  Created by Rinaldi Alfian on 23/01/23.
//

import UIKit
import Firebase
import FirebaseAuth

class RegisterViewController: UIViewController {

    @IBOutlet var emailText: UITextField!
    @IBOutlet var passwordText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

        // Do any additional setup after loading the view.
    }
    func register() {
        Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) { (authResult, error) in
            guard let user = authResult?.user, error == nil else {
                print("Error \(error?.localizedDescription)")
                return
            }
            let storyboard = UIStoryboard(name: "MainTabBar", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "MainTabBar")
            vc.modalPresentationStyle = .overFullScreen
            self.present(vc, animated: true)
            
            Analytics.logEvent(AnalyticsEventSignUp, parameters: nil)
        }
        
    }

    @IBAction func registerAction(_ sender: Any) {
        if emailText.text?.isEmpty == true {
            print("no email")
            return
        }
        if passwordText.text?.isEmpty == true {
            print("no password")
            return
        }
        register()
    }
    
    @IBAction func loginAction(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Login")
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true)
    }
    
}
