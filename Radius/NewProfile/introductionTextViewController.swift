//
//  introductionTextViewController.swift
//  Radius
//
//  Created by Kassandra Capretta on 11/7/19.
//  Copyright © 2019 Kassandra Capretta. All rights reserved.
//

import UIKit


class introductionTextViewController: UIViewController {

    // MARK:- Interface Builder
    @IBOutlet weak var nextScreen: UIButton!
    @IBAction func linkTapped(_ sender: UIButton) {
        if let url = NSURL(string: "https://www.radiusapp.co/blog/end-user-license-agreement"){
            UIApplication.shared.open(url as URL)
        }
    }
    
    // MARK:- ViewController LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backButton = UIBarButtonItem()
        backButton.title = ""
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        setUpElements()
        }
        
        func setUpElements() {
        
            Utilities.styleFilledButton(nextScreen)
        }
    
    // MARK:- Private Methods
    // Links to Community Guidelines
    @IBAction func guidelinesTapped(_ sender: UIButton) {
        if let url = NSURL(string: "https://www.radiusapp.co/blog/community-guidelines"){
            UIApplication.shared.open(url as URL)
        }
    }
    
    // Go to next View Controller
    @IBAction func nextTextVC(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextInfo = storyboard.instantiateViewController(identifier: "socialOptionsIntroViewController")
        self.navigationController?.pushViewController(nextInfo, animated: true)
            }
        }
