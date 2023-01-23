//
//  LoginViewController.swift
//  ilmuOneData
//
//  Created by Rinaldi Alfian on 23/01/23.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {
    
    
    @IBOutlet var emailText: UITextField!
    @IBOutlet var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func validateFields() {
        if emailText.text?.isEmpty == true {
            print("no email")
            return
        }
        if passwordText.text?.isEmpty == true {
            print("no password")
            return
        }
        signIn()
    }
    
    func signIn() {
        Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) { [weak self] authResult, err in
            guard let strongSelf = self else {return}
                if let err = err {
                    print(err.localizedDescription)
                }
            self!.checkUserInfo()
        }
    }
    
    func checkUserInfo() {
        if Auth.auth().currentUser != nil {
            print(Auth.auth().currentUser?.uid)
            
            let storyboard = UIStoryboard(name: "MainTabBar", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "MainTabBar")
            vc.modalPresentationStyle = .overFullScreen
            self.present(vc, animated: true)
        }
    }
    
    @IBAction func loginAction(_ sender: Any) {
        Analytics.logEvent(AnalyticsEventLogin, parameters: nil)
        
        validateFields()
    }
    
    @IBAction func registerAction(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Register")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
        
    }
    
    
}
