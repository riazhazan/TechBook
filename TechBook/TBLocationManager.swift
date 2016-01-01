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
        if (self.locationManager.respondsToSelector("requestAlwaysAuthorization")){
                self.locationManager.requestAlwaysAuthorization()
            }
        self.locationManager.desiredAccuracy = 45;
        self.locationManager.distanceFilter = 100;
        self.locationManager.startUpdatingLocation()
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
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
         print("location changed")
        
        let alertView : UIAlertView! = UIAlertView(title: "Location changed", message: "Your location changed to \(locations)", delegate: self, cancelButtonTitle: "OK")
        alertView.show()
    }

}
