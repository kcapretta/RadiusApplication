//
//  informationViewController.swift
//  Radius
//
//  Created by Kassandra Capretta on 11/16/19.
//  Copyright © 2019 Kassandra Capretta. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage

class informationViewController: BaseViewController {
    
    // MARK:- Interface Builder
    // Hometown text field
    @IBOutlet weak var hometownTextField: UITextField!
    // Job text field
    @IBOutlet weak var jobTextField: UITextField!
    // Birthdate text field
    @IBOutlet weak var inputText: UITextField!
    // Gender text field
    @IBOutlet weak var genderTextField: UITextField!
    // Religion text field
    @IBOutlet weak var religionText: UITextField!
    // Indicates activity to save to Firebase
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK:- Properties
    // Date picker for birthday
    private var datePicker: UIDatePicker?
    let genderPicker = UIPickerView()
    let religionPicker = UIPickerView()
    
    let firebaseServer = FirebaseFunctions.shared
    
    let gender = PickerViewDataSource.gender
    let religion = PickerViewDataSource.religion
    //let birthday = DatePickerDataSource.birthday
    var selectedGender: String?
    var selectedReligion: String?
    
    // MARK:- ViewController LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backButton = UIBarButtonItem()
        backButton.title = ""
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        createVCPicker()
        // createReligionPicker()
        createToolbar()
        
    }
    
    
    // MARK:- Private Methods
    @IBAction func next(_ sender: UIButton) {
        guard let hometown = hometownTextField.text,
            var gender = genderTextField.text,
            var job = jobTextField.text,
            var religion = religionText.text,
            var birthday = inputText.text else {
                return }
        
        if genderTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            jobTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            religionText.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            inputText.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            showAlert(withTitle: "Error", message: "Please fill in all fields")
            return }
        
        
        gender = gender.replacingOccurrences(of: " ", with: "").replacingOccurrences(of: "-", with: "").lowercased()
        religion = religion.replacingOccurrences(of: " ", with: "").replacingOccurrences(of: "-", with: "").lowercased()
        
        let homeTownInfo = UserInfo(type: "hometown", value: hometown, visible: true)
        let genderInfo = UserInfo(type: "gender", value: Gender.valueFor(choice: gender), visible: true)
        let religionInfo = UserInfo(type: "religion", value: Religion.valueFor(choice: religion), visible: true)
        let jobInfo = UserInfo(type: "job", value: job, visible: true)
        let birthdayInfo = UserInfo(type: "birthday", value: birthday, visible: true)
        
        firebaseServer.savePersonalDetailsOne(homeTownInfo, birthdayInfo, genderInfo, jobInfo, religionInfo) {[weak self] (error) in
            if error == nil {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let pageOne = storyboard.instantiateViewController(identifier: "FinalQuestionsViewController")
                self?.navigationController?.pushViewController(pageOne, animated: true)
            } else {
                self?.showAlert(withTitle: "Error", message: error?.localizedDescription)
            }
        }
    }
    
    func createVCPicker() {
        genderPicker.delegate = self
        genderTextField.inputView = genderPicker
        genderPicker.backgroundColor = .white
        
        // createReligionPicker()
        religionPicker.delegate = self
        religionText.inputView = religionPicker
        religionPicker.backgroundColor = .white
        
        // Date picker code
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(informationViewController.dateChanged(datePicker:)), for: .valueChanged)
        
        datePicker?.backgroundColor = .white
        // Birthday maximum
        datePicker!.maximumDate = Calendar.current.date(byAdding: .year, value: -21, to: Date())
        inputText.inputView = datePicker
        let now = Date()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(informationViewController.viewTapped(gestureRecognizer:)))
        
        view.addGestureRecognizer(tapGesture)
    }
    
    
    // Toolbar for "Done" on Picker View
    func createToolbar() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(informationViewController.dismissKeyboard))
        
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        // Make Toolbar work for Gender, Birthday and Religion
        genderTextField.inputAccessoryView = toolBar
        inputText.inputAccessoryView = toolBar
        religionText.inputAccessoryView = toolBar
        hometownTextField.inputAccessoryView = toolBar
        jobTextField.inputAccessoryView = toolBar
        
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    // Date Picker for Birthday
    @objc func dateChanged(datePicker: UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        
        inputText.text = dateFormatter.string(from: datePicker.date)
        
        datePicker.backgroundColor = .white
        inputText.font = UIFont(name: "Avenir", size: 15.0)
    }
}

// Extension on Gender Picker
extension informationViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case genderPicker: return gender.count
        case religionPicker: return religion.count
        default: return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case genderPicker:
            selectedGender = gender[row]
            genderTextField.text = selectedGender
            return gender[row]
        case religionPicker:
            selectedReligion = religion[row]
            religionText.text = selectedReligion
            return religion[row]
        default: return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView {
        case genderPicker:
            selectedGender = gender[row]
            genderTextField.text = selectedGender
        case religionPicker:
            selectedReligion = religion[row]
            religionText.text = selectedReligion
        default: print("Nothing")
        }
    }
    
}
