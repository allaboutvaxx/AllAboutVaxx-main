//
//  SignUpViewController.swift
//  AllAboutVaxxTest
//
//  Created by Derrick Duller on 3/9/22.
//

import UIKit
import Firebase
import FirebaseAuth

class SignUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet var email: UITextField!
    
    @IBOutlet var password: UITextField!
    
    @IBAction func signUpTapped(_ sender: Any) {
        if (email.text?.isEmpty == true) {
            print("No text in email field.")
            return
        }
        
        if (password.text?.isEmpty == true) {
            print("No text in password field.")
            return
        }
        
        signUP()
    }
    
    @IBAction func alreadyHaveAnAccountTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "logIn")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
    func signUP() {
        Auth.auth().createUser(withEmail: email.text!, password: password.text!) { (authResult, error) in
            guard let user = authResult?.user, error == nil else {
                print("Error \(error?.localizedDescription)")
                return
            }
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "mainMenu")
            vc?.modalPresentationStyle = .overFullScreen
            self.present(vc!, animated: true)
        }
    }
}
