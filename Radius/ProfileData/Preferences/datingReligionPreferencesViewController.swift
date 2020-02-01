//
//  datingReligionPreferencesViewController.swift
//  Radius
//
//  Created by Kassandra Capretta on 12/1/19.
//  Copyright © 2019 Kassandra Capretta. All rights reserved.
//

import UIKit

class datingReligionPreferencesViewController: UIViewController {

    @IBOutlet weak var atheist: UIButton!
    
    @IBOutlet weak var agnostic: UIButton!
    
    @IBOutlet weak var buddhist: UIButton!
    
    @IBOutlet weak var catholic: UIButton!
    
    @IBOutlet weak var christian: UIButton!
    
    @IBOutlet weak var hindu: UIButton!
    
    @IBOutlet weak var jewish: UIButton!
    
    @IBOutlet weak var muslim: UIButton!
    
    @IBOutlet weak var spiritual: UIButton!
    
    @IBOutlet weak var opentoall: UIButton!
    
    var selectedButtons: [Int] = []
    
    @IBAction func toggleDatingReligion(_ sender: UIButton) {
        updateColor(button: sender)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Utilities.styleHollowButton(atheist)
        Utilities.styleHollowButton(agnostic)
        Utilities.styleHollowButton(buddhist)
        Utilities.styleHollowButton(catholic)
        Utilities.styleHollowButton(christian)
        Utilities.styleHollowButton(hindu)
        Utilities.styleHollowButton(jewish)
        Utilities.styleHollowButton(muslim)
        Utilities.styleHollowButton(spiritual)
        Utilities.styleHollowButton(opentoall)
    }
    
    func updateColor(button: UIButton) {
        let tag = button.tag
        
        if let index =
            selectedButtons.firstIndex(of: tag) {
            selectedButtons.remove(at: index)
            Utilities.styleHollowButton(button)
        } else {
            selectedButtons.append(tag)
            Utilities.styleFilledButton(button)
        }
    }
    
    @IBAction func backButtonVC5(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
