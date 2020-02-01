//
//  HelpCenterViewController.swift
//  Radius
//
//  Created by Kassandra Capretta on 12/11/19.
//  Copyright © 2019 Kassandra Capretta. All rights reserved.
//

import UIKit

class HelpCenterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func radiusLinkTapped(_ sender: UIButton) {
        if let url = NSURL(string: "https://www.radiusapp.co/"){
            UIApplication.shared.open(url as URL)
        }
    }
    
    @IBAction func backButtonVC3(_ sender: Any) {
        dismiss(animated: true)
        
    }
}
