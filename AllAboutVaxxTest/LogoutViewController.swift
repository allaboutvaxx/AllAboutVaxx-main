//
//  LogoutViewController.swift
//  AllAboutVaxxTest
//
//  Created by Pritom Faisal on 3/13/22.
//

import UIKit
import Firebase
import FirebaseStorage
import FirebaseAuth

class LogoutViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var mainMenu: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var label: UILabel!
    
    private let storage = Storage.storage().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.numberOfLines = 0
        label.textAlignment = .center
        imageView.contentMode = .scaleAspectFit

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapButton(){
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated:true)
        
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as?UIImage else {
            return
        }
        guard let imageData = image.pngData() else{
            return
        }
        
        
        storage.child("images/file.png ").putData(imageData, metadata: nil, completion: { _, error in
            guard error == nil else {
                print("Failed to upload")
                return
            }
            
            self.storage.child("images/file.png ").downloadURL(completion: { url, error in
                guard let url = url, error == nil else {
                    return
                }
                
                let urlString = url.absoluteString
                print ("Download url: \(urlString)")
                UserDefaults.standard.set(urlString, forKey: "url")
            })
        })
        
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    //upload image data
    //get download url
    //save the url to userdefaults
    
    
  
    /*@IBAction func Logout(_ sender: Any) {
        let auth = Auth.auth()
        do{
            try auth.signOut()
            self.dismiss(animated: true, completion: nil)
        } catch let signOutError{
            
        }*/
    }

                        

        
