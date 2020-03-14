//
//  PageFourViewController.swift
//  Radius
//
//  Created by Kassandra Capretta on 11/19/19.
//  Copyright © 2019 Kassandra Capretta. All rights reserved.
//

import UIKit
import CoreLocation

class UseLocationAgreement: UIViewController {
    
    // MARK:- Interface Builder
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var soundsGood: UIButton!
    @IBOutlet weak var myView: UIView!
    
    // MARK:- Properties
    var locationManager: CLLocationManager?
    let firebaseServer = FirebaseFunctions.shared
    
    // MARK:- ViewController LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backButton = UIBarButtonItem()
        backButton.title = ""
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        Utilities.styleFilledButton(soundsGood)
        
        // Shadow on View
        self.myView.layer.shadowColor = UIColor.gray.cgColor
        self.myView.layer.shadowOpacity = 0.5
        self.myView.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.myView.layer.shadowRadius = 3
        self.myView.layer.masksToBounds = false
        
        // Show Location
        locationManager = CLLocationManager()
        locationManager?.delegate = self as? CLLocationManagerDelegate
        locationManager?.requestAlwaysAuthorization()
    }
    
    // MARK:- Private Methods
    func hasLocationPermission() -> Bool {
        var hasPermission = false
        if CLLocationManager.locationServicesEnabled() {
            switch CLLocationManager.authorizationStatus() {
            case .notDetermined, .restricted, .denied:
                hasPermission = false
            case .authorizedAlways, .authorizedWhenInUse:
                hasPermission = true
            @unknown default:
                fatalError()
            }
        } else {
            hasPermission = false
        }
        
        return hasPermission
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedAlways:
            print("Authorized always")
        case .authorizedWhenInUse:
            print("Wnen in use")
        default:
            print("Other permissions")
        }
    }
    
    
    @IBAction func nextPageVC(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let questionsVC = storyboard.instantiateViewController(identifier: "QuestionsViewController")
        self.navigationController?.pushViewController(questionsVC, animated: true)
    }
}

