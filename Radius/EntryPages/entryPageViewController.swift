//
//  entryPageViewController.swift
//  Radius
//
//  Created by Kassandra Capretta on 11/8/19.
//  Copyright © 2019 Kassandra Capretta. All rights reserved.
//

import UIKit

class entryPageViewController: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var signupButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpElements()
    }
    
    
    func setUpElements() {
        
        Utilities.styleFilledButton(signupButton)
        Utilities.styleHollowButton(loginButton)
    }
    
    
    @IBAction func signUp(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let signupVC = storyboard.instantiateViewController(identifier: "signupViewController")
        self.navigationController?.pushViewController(signupVC, animated: true)
    }
    @IBAction func logIn(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let loginVC = storyboard.instantiateViewController(identifier: "loginViewController")
        self.navigationController?.pushViewController(loginVC, animated: true)
    }
    
}
