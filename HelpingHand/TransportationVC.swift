//
//  TransportationVC.swift
//  HelpingHand
//
//  Created by amota511 on 12/30/17.
//  Copyright © 2017 Aaron Motayne. All rights reserved.
//

import UIKit
import GoogleMaps

class TransportationVC: UIViewController, CLLocationManagerDelegate, UITextFieldDelegate {

    var locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    var mapView: GMSMapView!
    
    var zoomLevel: Float = 14.0
    var destinationMarker: GMSMarker!
    var destinationSearchBar: UIView!
    var destinationTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //37.621177, -122.378827
        
        
        let camera = GMSCameraPosition.camera(withLatitude: 37.621177, longitude: -122.378827, zoom: zoomLevel)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        
        locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.distanceFilter = 50
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
        
        //placesClient = GMSPlacesClient.shared()
        
        
        view = mapView
        
        let currentLocation = CLLocationCoordinate2D(latitude: 37.275376, longitude: -121.854784)
        let marker = GMSMarker(position: currentLocation)
        
        marker.title = "SFO Airport"
        marker.iconView = UIImageView(image: #imageLiteral(resourceName: "Transportation_icon"))
        marker.iconView!.contentMode = .scaleAspectFit
        marker.iconView?.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        marker.map = mapView
        
        //        //37.275376, -121.854784
        let destinationLocation = CLLocationCoordinate2D(latitude: 37.275376, longitude: -121.854784)
        destinationMarker = GMSMarker(position: destinationLocation)
        
        destinationMarker?.title = "Home"
        destinationMarker?.iconView = UIImageView(image: #imageLiteral(resourceName: "delivery_icon"))
        destinationMarker?.iconView!.contentMode = .scaleAspectFit
        destinationMarker?.iconView!.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        destinationMarker.map = mapView
        
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
        
        createDestinationSearchBar()
        createDestinationTextField()
        
    }
    
    func createDestinationSearchBar() {
        let destinationSearchBar = UIView()
        destinationSearchBar.translatesAutoresizingMaskIntoConstraints = false
        
        destinationSearchBar.backgroundColor = UIColor(red: 245.0/255.0, green: 245.0/255.0, blue: 245.0/255.0, alpha: 1.0)
        //destinationSearchBar.alpha = 0.95
        
        destinationSearchBar.layer.cornerRadius = 5
        destinationSearchBar.clipsToBounds = true
        
        view.addSubview(destinationSearchBar)
        destinationSearchBar.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 0).isActive = true
        destinationSearchBar.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive = true
        destinationSearchBar.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12).isActive = true
        destinationSearchBar.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        destinationSearchBar.isUserInteractionEnabled = true
        destinationSearchBar.layer.borderColor = UIColor.lightGray.cgColor
        destinationSearchBar.layer.borderWidth = 0.25
        
        let destinationTapGestureRecognzer = UITapGestureRecognizer(target: self, action: #selector(destinationBarRecognizer))
        
        self.destinationSearchBar = destinationSearchBar
    }
    
    @objc func destinationBarRecognizer(sender : UITapGestureRecognizer) {
        
    }
    
    func createDestinationTextField() {
        let destinationTextField = UITextField()
        destinationTextField.translatesAutoresizingMaskIntoConstraints = false
        destinationTextField.delegate = self
        
        destinationTextField.placeholder = "Where ya heading?"
        //destinationTextField.
        destinationTextField.isUserInteractionEnabled = true
        destinationTextField.backgroundColor = UIColor(red: 235.0/255.0, green: 235.0/255.0, blue: 235.0/255.0, alpha: 1.0)
        
        destinationSearchBar.addSubview(destinationTextField)
        
        destinationTextField.topAnchor.constraint(equalTo: destinationSearchBar.topAnchor, constant: 5).isActive = true
        destinationTextField.leftAnchor.constraint(equalTo: destinationSearchBar.leftAnchor, constant: 6).isActive = true
        destinationTextField.rightAnchor.constraint(equalTo: destinationSearchBar.rightAnchor, constant: -6).isActive = true
        destinationTextField.heightAnchor.constraint(equalTo: destinationSearchBar.heightAnchor, multiplier: 1/2.2).isActive = true
        
        
        self.destinationTextField = destinationTextField
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location: CLLocation = locations.first!
        print("Location: \(location)")
        
        let camera = GMSCameraPosition.camera(withLatitude: location.coordinate.latitude,
                                              longitude: location.coordinate.longitude,
                                              zoom: mapView.camera.zoom)
        
        let destinationLocation = CLLocationCoordinate2D(latitude: location.coordinate.latitude,
                                                         longitude: location.coordinate.longitude)
        
        destinationMarker.position = destinationLocation
        
        
        if mapView.isHidden {
            mapView.isHidden = false
            mapView.camera = camera
        } else {
            mapView.animate(to: camera)
        }
        //mapView.selectedMarker?.appearAnimation = .pop
        //listLikelyPlaces()
    }
    
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .restricted:
            print("Location access was restricted.")
        case .denied:
            print("User denied access to location.")
            // Display the map using the default location.
            mapView.isHidden = false
        case .notDetermined:
            print("Location status not determined.")
        case .authorizedAlways: fallthrough
        case .authorizedWhenInUse:
            print("Location status is OK.")
        }
    }
    
    // Handle location manager errors.
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        locationManager.stopUpdatingLocation()
        print("Error: \(error)")
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("Destination Feild should begin editing")
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("Did begin editing text field")
    }
}
