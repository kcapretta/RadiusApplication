//
//  socialOptionsViewController.swift
//  Radius
//
//  Created by Kassandra Capretta on 11/26/19.
//  Copyright © 2019 Kassandra Capretta. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage

class socialOptionsViewController: UIViewController {

    @IBOutlet weak var socialView: UIView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // Tag to create separation in functions (see button below)
    var options: [Int: InterestedIn] = [0:.dating, 1: .networking, 2: .friendship]
    var choices: [InterestedIn] = []
    
    let firebaseServer = FirebaseFunctions.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Shadow on View
        self.socialView.layer.shadowColor = UIColor.gray.cgColor
        self.socialView.layer.shadowOpacity = 0.5
        self.socialView.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.socialView.layer.shadowRadius = 3
        self.socialView.layer.masksToBounds = false
        
        // Hide "Back"
        let backButton = UIBarButtonItem()
        backButton.title = ""
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
    }
    
    // Button tag for Interested In
    @IBAction func switchPushed(_ sender: UISwitch) {
        guard let interest = options[sender.tag] else { return }
        if sender.isOn {
            choices.append(interest)
        } else {
            if let index = choices.firstIndex(of: interest) {
                choices.remove(at: index)
            }
        }
    }
    
    // Process and save data to Firebase. Move onto next View Controller
    @IBAction func nextVCPhoto(_ sender: Any) {
               activityIndicator.startAnimating()
        let interests = UserInfo(type: "interestedin", value: choices, visible: true)
        firebaseServer.saveInterest(interestedIn: interests) {[weak self] (error) in
                   self?.activityIndicator.stopAnimating()
                   if(error == nil) {
                           let storyboard = UIStoryboard(name: "Main", bundle: nil)
                           let interestedIn = storyboard.instantiateViewController(identifier: "informationViewController")
                           self?.navigationController?.pushViewController(interestedIn, animated: true)

                   } else {
                       print("An error occured")
                   }
               }
    }

}
