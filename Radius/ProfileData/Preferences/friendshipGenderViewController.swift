//
//  friendshipGenderViewController.swift
//  Radius
//
//  Created by Kassandra Capretta on 12/2/19.
//  Copyright © 2019 Kassandra Capretta. All rights reserved.
//

import UIKit

class friendshipGenderViewController: UIViewController {
    
    // MARK:- Interface Builder
    @IBOutlet weak var menOption: UIButton!
    @IBOutlet weak var womenOption: UIButton!
    @IBOutlet weak var openToAll: UIButton!
    
    var selectedButtons:  [Int] = []
    
    @IBAction func toggleFriendshipGender(_ sender: UIButton) {
        updateColor(button: sender)
    }
    
    // MARK:- ViewController LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        Utilities.styleHollowButton(menOption)
        Utilities.styleHollowButton(womenOption)
        Utilities.styleHollowButton(openToAll)

    }
    
    // MARK:- Private Methods
    func updateColor(button: UIButton) {
    let tag = button.tag
    
    if let index = selectedButtons.firstIndex(of: tag) {
        selectedButtons.remove(at: index)
        Utilities.styleHollowButton(button)
    } else {
        selectedButtons.append(tag)
        Utilities.styleFilledButton(button)
        
        }
    }
    
    @IBAction func backButtonVC6(_ sender: Any) {
        dismiss(animated: true)
    
    }
}
