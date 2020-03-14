//
//  preferencesViewController.swift
//  Radius
//
//  Created by Kassandra Capretta on 12/1/19.
//  Copyright © 2019 Kassandra Capretta. All rights reserved.
//

import UIKit
import QuartzCore
import FirebaseDatabase
import WARangeSlider

class preferencesViewController: UIViewController {
    
    // For Age Range, after MVP
    // Pull data from Firebase
//    var ref:DatabaseReference?
//    var databaseHandle:DatabaseHandle?

    // Post as string
//    var postData = [String]()
    
    // Age Range Outlets
    @IBOutlet weak var datingAgeRange: UISlider!
    @IBOutlet weak var networkingAgeRange: UISlider!
    @IBOutlet weak var friendshipAgeRange: UISlider!
    
    // Age Range Labels
    @IBOutlet weak var datingAgeRangeLabel: UILabel!
    @IBOutlet weak var networkingAgeRangeLabel: UILabel!
    @IBOutlet weak var friendshipAgeRangeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // Age Range Actions
    // Set age preferences
    @IBAction func datingAgeRangeButton(_ sender: Any) {
        
        
        // install rangeSlider from here: https://github.com/warchimede/RangeSlider
        
//        let rangeSlider = RangeSlider(frame: frame)
//        view.addSubView(rangeSlider)
//        rangeSlider.addTarget(self, action: #selector(viewController.rangeSliderValueChanged(_:)),
//                                 for: .valueChanged)
        
        
        datingAgeRangeLabel.text = String(Int(round(datingAgeRange.value)))
        }
    
    @IBAction func networkingAgeRangeButton(_ sender: Any) {
        networkingAgeRangeLabel.text = String(Int(round(networkingAgeRange.value)))
    }
    
    @IBAction func friendshipAgeRangeButton(_ sender: Any) {
        friendshipAgeRangeLabel.text = String(Int(round(friendshipAgeRange.value)))
    }
    
    // Dating Ethnicity Preferences
    @IBAction func nextDatingEthnicity(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextDEVC = storyboard.instantiateViewController(identifier: "ethnicityPreferencesViewController")
        self.navigationController?.pushViewController(nextDEVC, animated: true)
    }
    
    @IBAction func backButtonVC1(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func nextDatingReligious(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextDRVC = storyboard.instantiateViewController(identifier: "datingReligionPreferencesViewController")
        self.navigationController?.pushViewController(nextDRVC, animated: true)
    }
    
    @IBAction func nextFriendshipGender(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextFGVC = storyboard.instantiateViewController(identifier: "friendshipGenderViewController")
        self.navigationController?.pushViewController(nextFGVC, animated: true)
    }
    
    @IBAction func nextFriendshipReligion(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextFRVC = storyboard.instantiateViewController(identifier: "friendshipReligionViewController")
        self.navigationController?.pushViewController(nextFRVC, animated: true)
        }
    
    @IBAction func nextDatingInterest(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextNDIVC = storyboard.instantiateViewController(identifier: "datingInterestsViewController")
        self.navigationController?.pushViewController(nextNDIVC, animated: true)
    }
}


