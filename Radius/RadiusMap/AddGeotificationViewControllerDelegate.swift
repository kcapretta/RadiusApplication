//
//  AddGeoViewController.swift
//  Radius
//
//  Created by Kassandra Capretta on 12/9/19.
//  Copyright © 2019 Kassandra Capretta. All rights reserved.
//

import UIKit
import MapKit

protocol AddGeotificationsViewControllerDelegate {
    func addGeotificationViewController(_ controller: AddGeotificationViewController, didAddCoordinate coordinate: CLLocationCoordinate2D,
                                        radius: Double, identifier: String, note: String, eventType: Geotification.EventType)
}

class AddGeotificationViewController: UITableViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    
    var delegate: AddGeotificationsViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
}

