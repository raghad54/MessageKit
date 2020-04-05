//
//  RegisterViewController.swift
//  MessageKitDemo
//
//  Created by Raghad'Mac on 11/16/19.
//  Copyright © 2019 Raghad'Mac. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase



class RegisterViewController: UIViewController {

    @IBOutlet weak var userNameTextFeild: UITextField!
    @IBOutlet weak var emailTextFeild: UITextField!
    @IBOutlet weak var passwordTextFeild: UITextField!
     var ref: DatabaseReference!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func registerButtonPressed() {
      
        configurationFirebaseRegister()
    }
    
    private func configurationFirebaseRegister() {
        guard let email = emailTextFeild.text, let password = passwordTextFeild.text, let name = userNameTextFeild.text else {
                  print("Error")
                  return
              }
        Auth.auth().createUser(withEmail: email, password: password) { (User, error) in
            if error != nil {
                return
            }
            guard let usaerUid = User?.user.uid else {
                return
            }
            print("Successfully Saved")
            self.ref = Database.database().reference(fromURL: "https://chatting-54a34.firebaseio.com/")
            let userReference = self.ref.child("users").child(usaerUid)
            let value = ["name": name,"email": email]
            userReference.updateChildValues(value) { (error, ref) in
                if error != nil {
                    return
                }
            print("Success")
                let controller = self.storyboard?.instantiateViewController(withIdentifier: "NewMessageTableViewController") as! NewMessageTableViewController
                self.navigationController?.pushViewController(controller, animated: true)
            }
        }
    }

   
}
