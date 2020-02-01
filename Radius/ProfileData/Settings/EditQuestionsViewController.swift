//
//  EditQuestionsViewController.swift
//  Radius
//
//  Created by Kassandra Capretta on 12/14/19.
//  Copyright © 2019 Kassandra Capretta. All rights reserved.
//

import UIKit
import FirebaseDatabase

class EditQuestionsViewController: BaseViewController {
    
    @IBOutlet weak var Q1TextField: UITextField!
    
    @IBOutlet weak var Q2TextField: UITextField!
    
    @IBOutlet weak var Q3TextField: UITextField!
    
//    @IBOutlet weak var Q4TextField: UITextField!
//
//    @IBOutlet weak var Q5TextField: UITextField!
//
//    @IBOutlet weak var Q6TextField: UITextField!
    
    // Pull data from Firebase
    var ref:DatabaseReference?
    var databaseHandle:DatabaseHandle?

    // Post as string
    var postData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createToolbar()

        Q1TextField.text = newUser.lifeGoal?.value
        Q2TextField.text = newUser.teachMe?.value
        Q3TextField.text = newUser.changeMind?.value
//        Q4TextField.text = newUser.takePride?.value
//        Q5TextField.text = newUser.imLookingFor?.value
//        Q6TextField.text = newUser.toKnow?.value
        
        
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
    // Toolbar for "Done" on Picker View
        func createToolbar() {
            let toolBar = UIToolbar()
            toolBar.sizeToFit()
            
            let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(informationViewController.dismissKeyboard))
            
            toolBar.setItems([doneButton], animated: false)
            toolBar.isUserInteractionEnabled = true

    // Make Toolbar work for Gender, Birthday and Religion
            Q1TextField.inputAccessoryView = toolBar
            Q2TextField.inputAccessoryView = toolBar
            Q3TextField.inputAccessoryView = toolBar
//            Q4TextField.inputAccessoryView = toolBar
//            Q5TextField.inputAccessoryView = toolBar
//            Q6TextField.inputAccessoryView = toolBar
        }
        
        @objc func dismissKeyboard() {
            view.endEditing(true)
        }
        
        @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer) {
        view.endEditing(true)
        }
}
