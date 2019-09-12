//
//  ViewController.swift
//  PixelCity
//
//  Created by leslie on 9/5/19.
//  Copyright © 2019 leslie. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapVC: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager = CLLocationManager()
    var authorizationStatus = CLLocationManager.authorizationStatus()
    // 1000m
    let regionDistance: Double = 1000
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        locationManager.delegate = self
        configureLocationServices()
    }

    @IBAction func centerMapBtn(_ sender: Any) {
        if authorizationStatus == .authorizedAlways || authorizationStatus == .authorizedWhenInUse {
            centerMapOnUserLocation()
        }
    }
    
}

extension MapVC: MKMapViewDelegate {
    
    func centerMapOnUserLocation() {
        guard let coordinate = locationManager.location?.coordinate else {
            return
        }
        let coordinateRegion = MKCoordinateRegion(center: coordinate, latitudinalMeters: regionDistance * 2.0, longitudinalMeters: regionDistance * 8.0)
        mapView.setRegion(coordinateRegion, animated: true)
        
    }
}

extension MapVC: CLLocationManagerDelegate {
    
    func configureLocationServices() {
        if authorizationStatus == .notDetermined {
            locationManager.requestAlwaysAuthorization()
        } else {
            return
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        centerMapOnUserLocation()
    }
}
