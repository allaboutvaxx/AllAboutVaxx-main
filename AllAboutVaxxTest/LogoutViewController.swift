//
//  LogoutViewController.swift
//  AllAboutVaxxTest
//
//  Created by Pritom Faisal on 3/13/22.
//

import UIKit
import Firebase
import FirebaseAuth

class LogoutViewController: UIViewController {

    @IBOutlet weak var mainMenu: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func Logout(_ sender: Any) {
        let auth = Auth.auth()
        do{
            try auth.signOut()
            self.dismiss(animated: true, completion: nil)
        } catch let signOutError{
            
        }
    }
}
