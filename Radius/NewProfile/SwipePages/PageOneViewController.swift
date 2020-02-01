//
//  PageOneViewController.swift
//  Radius
//
//  Created by Kassandra Capretta on 11/19/19.
//  Copyright © 2019 Kassandra Capretta. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage

class PageOneViewController: BaseViewController, UITextFieldDelegate, UIPickerViewDelegate {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var schoolInput: UITextField!
    
    @IBOutlet weak var educationText: UITextField!
    
    @IBOutlet weak var politicalText: UITextField!
    
    @IBOutlet weak var drinkingText: UITextField!
    
    @IBOutlet weak var heightText: UITextField!
    
    let height = PickerViewDataSource.heights
    
    let educationPicker = UIPickerView()
    let politicsPicker = UIPickerView()
    let drinkPicker = UIPickerView()
    let heightsPicker = UIPickerView()
    
    let firebaseServer = FirebaseFunctions.shared
    
    let education = PickerViewDataSource.education
    let politics = PickerViewDataSource.politics
    let drinking = PickerViewDataSource.drinking
    let heights = PickerViewDataSource.heights
    
    var selectedEducation: String?
    var selectedPolitics: String?
    var selectedDrinking: String?
    var selectedHeight: String?
    
        override func viewDidLoad() {
        super.viewDidLoad()
            
            let backButton = UIBarButtonItem()
            backButton.title = ""
            self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton

            
         createEducationPicker()
         createToolbar()
    }
    
    
    @IBAction func next(_ sender: UIButton) {
        
        guard let school = schoolInput.text,
            var education = educationText.text,
            var politics = politicalText.text,
            var drinking = drinkingText.text,
            var height = heightText.text else {
                showAlert(message: "Please fill in all fields", title: "Error")
                return }
        
        if schoolInput.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
              educationText.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
              politicalText.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            heightText.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            drinkingText.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
              
              showAlert(withTitle: "Error", message: "Please fill in all fields")
              return }
        
        politics = politics.replacingOccurrences(of: " ", with: "").replacingOccurrences(of: "-", with: "").lowercased()
        education = education.replacingOccurrences(of: " ", with: "").replacingOccurrences(of: "-", with: "").lowercased()
        drinking = drinking.replacingOccurrences(of: " ", with: "").replacingOccurrences(of: "-", with: "").lowercased()
        height = height.replacingOccurrences(of: " ", with: "").replacingOccurrences(of: "-", with: "").lowercased()
        
        let schoolInfo = UserInfo(type: "school", value: school, visible: true)
        let educationInfo = UserInfo(type: "education", value: EducationLevel.valueFor(choice: education), visible: true)
        let politicsInfo = UserInfo(type: "politics", value: Politics.valueFor(choice: politics), visible: true)
        let drinkInfo = UserInfo(type: "drink", value: Drink.valueFor(choice: drinking), visible: true)
        let heightInfo = UserInfo(type: "height", value: height, visible: true)
        
        firebaseServer.savePersonalDetailsTwo(schoolInfo, educationInfo, politicsInfo, drinkInfo, heightInfo) {[weak self] (error) in
            
            if error == nil {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let pageOne = storyboard.instantiateViewController(identifier: "PageFourViewController")
                self?.navigationController?.pushViewController(pageOne, animated: true)
            }
            print("Done but with error ...", error)
        }
    }

    
    func createEducationPicker() {
        educationPicker.delegate = self
        educationText.inputView = educationPicker
        educationPicker.backgroundColor = .white
        
        politicsPicker.delegate = self
        politicalText.inputView = politicsPicker
        politicsPicker.backgroundColor = .white
        
        drinkPicker.delegate = self
        drinkingText.inputView = drinkPicker
        drinkPicker.backgroundColor = .white
        
        heightsPicker.delegate = self
        heightText.inputView = heightsPicker
        heightsPicker.backgroundColor = .white
    }
    
        // Toolbar for "done"
        func createToolbar() {
            let toolBar = UIToolbar()
            toolBar.sizeToFit()


            let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(PageOneViewController.dismissKeyboard))

            toolBar.setItems([doneButton], animated: false)
            toolBar.isUserInteractionEnabled = true

            // Makes toolbar apply to text fields
            educationText.inputAccessoryView = toolBar
            politicalText.inputAccessoryView = toolBar
            drinkingText.inputAccessoryView = toolBar
            heightText.inputAccessoryView = toolBar
            schoolInput.inputAccessoryView = toolBar
        }

    @objc func dismissKeyboard() {
            view.endEditing(true)
        }
    
    
    // Picker Extension
}

    extension PageOneViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // Counting Picker View
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case educationPicker: return education.count
        case politicsPicker: return politics.count
        case drinkPicker: return drinking.count
        case heightsPicker: return height.count
        default: return 0
        }
    }
    
    // Rows
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case educationPicker:
            selectedEducation = education[row]
            educationText.text = selectedEducation
            return education[row]
        case politicsPicker:
            selectedPolitics = politics[row]
            politicalText.text = selectedPolitics
            return politics[row]
        case drinkPicker:
            selectedDrinking = drinking[row]
            drinkingText.text = selectedDrinking
            return drinking[row]
        case heightsPicker:
            selectedHeight = height[row]
            heightText.text = selectedHeight
            return height[row]
            
        default: return ""
        }
    }
    
    // didSelect Function
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView {
        case educationPicker:
            selectedEducation = education[row]
            educationText.text = selectedEducation
        case politicsPicker:
            selectedPolitics = politics[row]
            politicalText.text = selectedPolitics
        case drinkPicker:
            selectedDrinking = drinking[row]
            drinkingText.text = selectedDrinking
        case heightsPicker:
            selectedHeight = height[row]
            heightText.text = selectedHeight
        default: print("Nothing...")
        }
        if(pickerView == educationPicker) {
            selectedEducation = education[row]
            educationText.text = selectedEducation
        } else if (pickerView == politicsPicker) {
        }
    
    }

}
