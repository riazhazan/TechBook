//
//  TBLocationManager.swift
//  TechBook
//
//  Created by Riaz Hassan on 07/12/15.
//  Copyright © 2015 Riaz Hassan. All rights reserved.
//

import UIKit
import CoreLocation

class TBLocationManager: NSObject,CLLocationManagerDelegate {
    
    var locationManager:CLLocationManager = CLLocationManager()
    var location = CLLocationCoordinate2D()
    
    override init()
    {
        print("init")
        super.init()
        location = CLLocationCoordinate2D(latitude: 0, longitude: 0)

        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        if (self.locationManager.respondsToSelector("requestWhenInUseAuthorization")){

                //self.locationManager.requestWhenInUseAuthorization()
                self.locationManager.requestAlwaysAuthorization()
            }
    }
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        print("didChangeAuthorizationStatus")
        
        switch status {
        case .NotDetermined:
            print(".NotDetermined")
            break
            
        case .Authorized:
            print(".Authorized")
            self.locationManager.startUpdatingLocation()
            break
            
        case .Denied:
            print(".Denied")
            break
            
        default:
            print("Unhandled authorization status")
            break
            
        }
    }
  

}
