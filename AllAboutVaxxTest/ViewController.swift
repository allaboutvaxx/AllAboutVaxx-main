//
//  ViewController.swift
//  AllAboutVaxxTest
//
//  Created by Abir Das on 2/4/22.
//

import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController {

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
