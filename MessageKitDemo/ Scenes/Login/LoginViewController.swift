//
//  LoginViewController.swift
//  MessageKitDemo
//
//  Created by Raghad'Mac on 11/ /19.
//  Copyright © 2019 Raghad'Mac. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextFeild: UITextField!
    @IBOutlet weak var passwordTextFeild: UITextField!
    var ref: DatabaseReference!

    
    override func viewDidLoad() {
           super.viewDidLoad()
//        let domain = Bundle.main.bundleIdentifier!
//        UserDefaults.standard.removePersistentDomain(forName: domain)
//        UserDefaults.standard.synchronize()
       // Database.database().reference(fromURL: ).child(kUser).child(userID).removeValue()

      
    }
    override func viewWillAppear(_ animated: Bool) {

    }
    
    
    private func checkUserAvailable() {
//        print(AppSettings.uid)
//        let uid = Auth.auth().currentUser?.uid
//        Database.database().reference(fromURL: "https://chatting-54a34.firebaseio.com/").child(uid!).removeValue()
//        var user = Auth.auth().currentUser
//        user?.delete()
//        print(user)
         if Auth.auth().currentUser?.uid == nil {
            let controller = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            self.navigationController?.pushViewController(controller, animated: true)
               // handleLogout()
               } else {
                AppSettings.displayName = Auth.auth().currentUser?.email
                AppSettings.uid = Auth.auth().currentUser?.uid
            
                  let controller = self.storyboard?.instantiateViewController(withIdentifier: "NewMessageTableViewController") as! NewMessageTableViewController
                  self.navigationController?.pushViewController(controller, animated: true)
                }
    }
    
    private func handleLogout() {
        do {
           try Auth.auth().signOut()
            
        } catch let logoutError {
            print("LogoutError")
        }
    }
     
    @IBAction func loginButtonTapped() {
         login()
 }
    
    @IBAction func registerBUttonTapped() {
        let controller = storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        self.presentingViewController?.addChild(controller)
       }
    
    private func login() {
        guard let email = emailTextFeild.text, let password = passwordTextFeild.text else {
            print("Error")
            return
        }
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if error != nil {
                print("Login Error")
                let alert = UIAlertController(title: "Alert", message: "Email or Password incorrect", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                return
            }
            print(user)
            UserDefaults.standard.set("displayName", forKey: "displayName")
            let controller = self.storyboard?.instantiateViewController(withIdentifier: "NewMessageTableViewController") as! NewMessageTableViewController
            self.navigationController?.pushViewController(controller, animated: true)
        }
        
    }
    
    
}


