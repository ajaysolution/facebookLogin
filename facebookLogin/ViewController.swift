//
//  ViewController.swift
//  facebookLogin
//
//  Created by Ajay Vandra on 2/12/20.
//  Copyright © 2020 Ajay Vandra. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FBSDKLoginKit
import FBSDKShareKit

class ViewController: UIViewController {

    let userDefaullt = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if userDefaullt.bool(forKey: ""){
            performSegue(withIdentifier: "homeView", sender: self)
        }
    }
    
    


    @IBAction func fbLogin(_ sender: UIButton) {
        let fbLogin = LoginManager()
        fbLogin.logIn(permissions: ["public_profile", "email"], from: self){
            Result,error in
            if let error = error
            {
                print("Failed to login: \(error.localizedDescription)")
                return
            }
                   
            guard let accessToken = AccessToken.current else
            {
                print("Failed to get access token")
                return
            }
            
            let credential = FacebookAuthProvider.credential(withAccessToken: accessToken.tokenString)
                   
            Auth.auth().signIn(with: credential, completion: { (user, error) in
                if let error = error {
                        print("Login error: \(error.localizedDescription)")
                        let alertController = UIAlertController(title: "Login Error", message: error.localizedDescription, preferredStyle: .alert)
                        let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                        alertController.addAction(okayAction)
                        self.present(alertController, animated: true, completion: nil)
                           
                        return
                }
                else{
                    self.performSegue(withIdentifier: "homeView", sender: self)
                }
            
                
                       
            })
        }
    }
}

