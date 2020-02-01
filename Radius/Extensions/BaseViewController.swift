//
//  BaseViewController.swift
//  Radius
//
//  Created by Kassandra Capretta on 12/15/19.
//  Copyright © 2019 Kassandra Capretta. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    // Requires Text Field to be Filled
    func showAlert(message: String, title: String) {
        let alertAction = UIAlertAction(title: "", style: .cancel, handler: nil)
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
}
