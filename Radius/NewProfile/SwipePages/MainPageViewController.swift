//
//  MainPageViewController.swift
//  Radius
//
//  Created by Kassandra Capretta on 11/19/19.
//  Copyright © 2019 Kassandra Capretta. All rights reserved.
//

import UIKit

class MainPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backButton = UIBarButtonItem()
        backButton.title = ""
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton

    }

}
