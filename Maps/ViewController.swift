//
//  ViewController.swift
//  Maps
//
//  Created by Gracjana Leonowicz on 03.10.2017.
//  Copyright © 2017 Gracjana Leonowicz. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let latitude: CLLocationDegrees = 34.13
        let longitude: CLLocationDegrees = -118.32
        let latDelta: CLLocationDegrees = 0.05
        let lonDelta: CLLocationDegrees = 0.05
        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
        let location: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let region: MKCoordinateRegion = MKCoordinateRegion(center: location, span: span)
        map.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.title = "Hollywood sign"
        annotation.subtitle = "Maybe I will go there one more time"
        annotation.coordinate = location
        map.addAnnotation(annotation)
        
        let uiGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(longpress(gestureRecognizer:)))
        uiGestureRecognizer.minimumPressDuration = 2
        map.addGestureRecognizer(uiGestureRecognizer)
        
    }
    
    @objc func longpress(gestureRecognizer: UIGestureRecognizer) {
        let touchPoint = gestureRecognizer.location(in: self.map)
        let coordinate = map.convert(touchPoint, toCoordinateFrom: self.map)
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = "New place"
        annotation.subtitle = "Maybe I'll go here too"
        map.addAnnotation(annotation)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

