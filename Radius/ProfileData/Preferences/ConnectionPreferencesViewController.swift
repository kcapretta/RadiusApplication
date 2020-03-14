//
//  ConnectionPreferencesViewController.swift
//  Radius
//
//  Created by Kassandra Capretta on 12/16/19.
//  Copyright © 2019 Kassandra Capretta. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ConnectionPreferencesViewController: UIViewController {
    
    // MARK:- Interface Builder
    @IBOutlet weak var datingSwitched: UISwitch!
    @IBOutlet weak var networkingSwitched: UISwitch!
    @IBOutlet weak var friendshipSwitched: UISwitch!
    
    // MARK:- Properties
    // Pull data from Firebase
    var ref:DatabaseReference?
    var databaseHandle:DatabaseHandle?
    var firebaseServer = FirebaseFunctions.shared
    // Post
    var postData = [UISwitch]()

    // MARK:- ViewController LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        datingSwitched.UISwitch = newUser.dating?.value
        setDefaultSelections()

    }
    
    // MARK:- Private Methods
    func setDefaultSelections() {
        if let interests = newUser.interestedIn?.value {
            interests.forEach { (interestedIn) in
                switch interestedIn {
                case .dating: datingSwitched.isOn = true
                case .networking: networkingSwitched.isOn = true
                case .friendship: friendshipSwitched.isOn = true
                }
            }
        }
        
    }
  
    @IBAction func backButtonTapped(_ sender: UIButton) {
    dismiss(animated: true)
        }
    }

