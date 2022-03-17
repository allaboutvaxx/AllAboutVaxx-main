//
//  LogInViewController.swift
//  AllAboutVaxxTest
//
//  Created by Derrick Duller on 3/9/22.
//

import UIKit
import Firebase
import FirebaseAuth

class LogInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet var warning: UILabel!
    //override func viewDidAppear(_ animated: Bool) {
        //checkUserInfo()
    //}
   
    @IBOutlet var email: UITextField!
    
    @IBOutlet var password: UITextField!
    
    @IBAction func loginTapped(_ sender: Any) {
        validateFields()
    }
    
    @IBAction func createAccountTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "signUp")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
    func validateFields() {
        if (email.text?.isEmpty == true) {
            print("No text in email field.")
            return
        }
        
        if (password.text?.isEmpty == true) {
            print("No text in password field.")
            return
        }
        
        loginFunction()
    }
    
    func loginFunction() {
        Auth.auth().signIn(withEmail: email.text!, password: password.text!) { [weak self] authResult, err in
            guard let strongSelf = self else {return}
            if let err = err {
                print(err.localizedDescription)
                self?.warning.text = "Login credentials are incorrect. Try again."
            }
            self!.checkUserInfo()
        }
    }
    
    func checkUserInfo() {
        if (Auth.auth().currentUser != nil) {
            print(Auth.auth().currentUser?.uid)
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "mainMenu")
            vc.modalPresentationStyle = .overFullScreen
            present(vc, animated: true)
        }
    }

}
