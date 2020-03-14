//
//  AccountViewController.swift
//  Radius
//
//  Created by Kassandra Capretta on 12/11/19.
//  Copyright © 2019 Kassandra Capretta. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class AccountViewController: UIViewController {
    
    // MARK:- Properties
    // Pull data from Firebase
    var ref:DatabaseReference?
    var databaseHandle:DatabaseHandle?
    // Post as string
    var postData = [String]()
    
    // MARK:- Interface Builder
    @IBOutlet weak var phoneNumberText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    
    // Push notifications on / off
    //    @IBAction func pushNotificationSwitch(_ sender: UISwitch) {
    //        UIApplication.shared.unregisterForRemoteNotifications()
    //        UIApplication.shared.registerForRemoteNotifications()
    //    }
    
    // MARK:- Private Methods
    @IBAction func linkTapped(_ sender: UIButton) {
        if let url = NSURL(string: "https://www.radiusapp.co/blog/privacypolicy"){
            UIApplication.shared.open(url as URL)
        }
    }
    
    @IBAction func termsLinkedTapped(_ sender: UIButton) {
        if let url = NSURL(string: "https://www.radiusapp.co/blog/termsofservice"){
            UIApplication.shared.open(url as URL)
        }
    }
    
    @IBAction func safetyLinkedTapped(_ sender: UIButton) {
        if let url = NSURL(string: "https://www.radiusapp.co/blog/safetytips"){
            UIApplication.shared.open(url as URL)
        }
    }
    
    @IBAction func EULALinkTapped(_ sender: UIButton) {
        if let url = NSURL(string: "https://www.radiusapp.co/blog/end-user-license-agreement"){
            UIApplication.shared.open(url as URL)
        }
    }
    
    // MARK:- ViewController LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createToolbar()
        emailText.text = newUser.email
        
    }
    
    @IBAction func signOutTapped(_ sender: UIButton) {
        try! Auth.auth().signOut()
        
        if let storyboard = self.storyboard {
            let vc = storyboard.instantiateViewController(withIdentifier: "NavigationController") as! UINavigationController
            self.present(vc, animated: false, completion: nil)
        }
    }
    
    @IBAction func deleteAccountTapped(_ sender: UIButton) {
        let user = Auth.auth().currentUser
        
        user?.delete { error in
            if let error = error {
                print("Error... ", user!, error)
            } else {
                print("Account Successfully Deleted")
            }
        }
    }
    
    @IBAction func backButtonVC2(_ sender: Any) {
        dismiss(animated: true)
    }
    
    // Toolbar for "Done" on Picker View
    func createToolbar() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(informationViewController.dismissKeyboard))
        
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        // Make Toolbar work for Gender, Birthday and Religion
        phoneNumberText.inputAccessoryView = toolBar
        emailText.inputAccessoryView = toolBar
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer) {
        view.endEditing(true)
    }
}
