//
//  datingInterestsViewController.swift
//  Radius
//
//  Created by Kassandra Capretta on 12/19/19.
//  Copyright © 2019 Kassandra Capretta. All rights reserved.
//

import UIKit

class datingInterestsViewController: UIViewController {
    
    // MARK:- Interface Builder
    @IBOutlet weak var datingMenSelection: UIButton!
    @IBOutlet weak var datingWomenSelection: UIButton!
    @IBOutlet weak var openToAll: UIButton!
    
    var selectedButtons: [Int] = []
    
    @IBAction func toggledDatingInterest(_ sender: Any) {
        updateColor(button: sender as! UIButton)
    }
    
    // MARK:- ViewController LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Utilities.styleHollowButton(datingMenSelection)
        Utilities.styleHollowButton(datingWomenSelection)
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
    
    @IBAction func backToPreferences(_ sender: Any) {
        dismiss(animated: true)
    }
    
}
