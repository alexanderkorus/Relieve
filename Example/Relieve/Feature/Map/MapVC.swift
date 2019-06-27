//
//  MapVC.swift
//  Relieve_Example
//
//  Created by Alexander Korus on 27.06.19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import Relieve
import RxSwift
import RxCocoa
import MapKit
import CoreLocation

final class MapVC: UIViewController {

    // MARK: Delegate Properties
    private let delegate: MapVCDelegate

    // MARK: Initializers
    init(delegate: MapVCDelegate) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: UIViewController Lifecycle Methods
    override func loadView() {
        self.view = MapView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.configureNavigationBar(visibilty: true, title: "MapKit Example", backgroundColor: UIColor.red, titleColor: .white)
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.requestLocation()
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkLocationAuthorizationStatus()
    }

    // MARK: Overridden UIKit Methods

    // MARK: Stored Properties
    private let disposeBag = DisposeBag()
    private let regionRadius: CLLocationDistance = 1000
    private let locationManager = CLLocationManager()
    private var currentLocation: CLLocation? {
        didSet {
            guard let currentLocation = currentLocation else { return }
            centerMapOnLocation(location: currentLocation)
        }
    }

    // MARK: Computed Properties

    // MARK: Instance Methods
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        self.mapView.setRegion(coordinateRegion, animated: true)
    }

    func checkLocationAuthorizationStatus() {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            mapView.showsUserLocation = true
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }
}

// MARK: - Views
private extension MapVC {
    unowned var rootView: MapView { return self.view as! MapView }
    unowned var mapView: MKMapView { return self.rootView.mapView }
}

// MARK: - Target Action Functions
private extension MapVC {

}

extension MapVC: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        self.currentLocation = manager.location
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
