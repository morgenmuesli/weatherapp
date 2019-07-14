//
//  LocationService.swift
//  Christoph_WeatherApp
//
//  Created by Christoph Meyer on 12.07.19.
//  Copyright © 2019 Christoph Meyer. All rights reserved.
//

import UIKit
import CoreLocation

class LocationService: NSObject {
    
    
    // function pointers
    var newestLocation: ((CLLocationCoordinate2D?) -> Void)?
    // var statusUpdated: ((CLAuthorizationStatus) -> Void)?
    // location manager
    let locationManager = CLLocationManager()
    
    // authoriaztion status
    var status: CLAuthorizationStatus {
        return CLLocationManager.authorizationStatus()
    }
    
    
    
    
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
        
    }
    
    public override init() {
        super.init()
        checkLocationServices()
        
    }

    
    /** checks if location services are enabled
     *
     */
    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
            checkLocationAuthorization()
        }else {
            print("location services aren't enabled")
        }
    }
    
    func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            locationManager.requestLocation()
            break
        case .denied:
            // show alert instructing
            break
        case .notDetermined:
            // ask for permissions
            locationManager.requestWhenInUseAuthorization()
            break
        case .restricted:
            // show alert instructing
            print("bad kid, your parents are evil!")
            break
        case .authorizedAlways:
            break
        
            
        @unknown default:
            fatalError()
        }
    }
    
    func getPermission() {
        locationManager.requestWhenInUseAuthorization()
    }
    
    func getLocation() {
        locationManager.requestLocation()
    }
}

extension LocationService: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            self.newestLocation?(location.coordinate)
        } else {
            self.newestLocation?(nil)
        }
        

    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        //self.statusUpdated?(status)
        self.checkLocationAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
    {
        print("Error \(error)")
    }
    
}

