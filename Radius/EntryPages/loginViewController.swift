
//
//  loginViewController.swift
//  Radius
//
//  Created by Kassandra Capretta on 11/4/19.
//  Copyright © 2019 Kassandra Capretta. All rights reserved.
//

import UIKit
import FirebaseAuth

class loginViewController: UIViewController, UITextFieldDelegate {
    
    // MARK:- Interface Builder
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var errorLabel: UILabel!
    
    let firebaseServer = FirebaseFunctions.shared
    
    // MARK:- ViewController LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Hide "Back" in Back Button
        let backButton = UIBarButtonItem()
        backButton.title = ""
        
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        Utilities.styleFilledButton(loginButton)
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        setUpElements()
    }
    
    func setUpElements() {
        // Hide the error label
        errorLabel.alpha = 0
    }
    
    // MARK:- Private Methods
    @IBAction func loginTapped(_ sender: Any) {
        // Create cleaned text fields
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Signing in the user
        firebaseServer.signIn(email: email, password: password) { (user, error) in
            
            print("User Object", user)
            if let error = error {
                self.showAlert(withTitle: "Error", message: "Login failed. Please try again")
                print("sign in error \(error.localizedDescription)")
            } else{
                
                UserDefaults.standard.set(true, forKey: "signedIn")
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let homeVC = storyboard.instantiateViewController(withIdentifier:  "HomeTabBarController")
                
                //as! EditQuestionsViewController
                
                self.view.window?.rootViewController = homeVC
                self.view.window?.makeKeyAndVisible()
            }
        }
        
    }
    
    // Forgot Password, next View Controller
    @IBAction func forgotPW(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let forgotPassword = storyboard.instantiateViewController(identifier: "forgotPasswordViewController")
        self.navigationController?.pushViewController(forgotPassword, animated: true)
    }
}
