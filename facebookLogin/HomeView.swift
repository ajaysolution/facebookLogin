//
//  HomeView.swift
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

class HomeView: UIViewController {

    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var profilePic: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let email = Auth.auth().currentUser?.displayName
        self.email.text = email
        let pic = Auth.auth().currentUser?.photoURL
        let data = NSData(contentsOf: pic!)
        
        self.profilePic.image = UIImage(data: data! as Data)
        // Do any additional setup after loading the view.
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
