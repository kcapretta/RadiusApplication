//
//  RadiusLocations.swift
//  Radius
//
//  Created by Kassandra Capretta on 1/28/20.
//  Copyright © 2020 Kassandra Capretta. All rights reserved.
//

import Foundation
import MapKit
import CoreLocation

class CityLocation: NSObject, MKAnnotation, MKMapViewDelegate {
    var title: String?
    var coordinate: CLLocationCoordinate2D
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
    let circleRenderer = MKCircleRenderer(overlay: overlay)
    circleRenderer.strokeColor = UIColor.red
    circleRenderer.lineWidth = 2.0
    return circleRenderer
    }
    
    func showCircle(coordinate: CLLocationCoordinate2D, radius: CLLocationDistance, mapView: MKMapView) {
           let circle = MKCircle(center: coordinate, radius: radius)
           mapView.addOverlay(circle)
       }
    
    init(title: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
 //       let regionRadius = 100.0
            //       let circle = MKCircle(center: coordinate, radius: regionRadius)
//        mapView.region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
//        mapView.addOverlay(circle)
//        mapView.region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
    }

}
