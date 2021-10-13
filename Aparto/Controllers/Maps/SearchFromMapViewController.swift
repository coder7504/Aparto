//
//  SearchFromMapViewController.swift
//  Aparto
//
//  Created by Mac user on 03/10/21.
//

import UIKit
import YandexMapsMobile
import MapKit

class SearchFromMapViewController: UIViewController {

    @IBOutlet weak var mapView: YMKMapView!
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var coordinate: YMKPoint!
    var locationManager: CLLocationManager?
    var largeTitle: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideContainerView()
        titleLabel.text = largeTitle
        containerView.layer.cornerRadius = 16
        containerView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        
        
        let mapObjects = mapView.mapWindow.map.mapObjects
        
//        let mapKit = YMKMapKit.sharedInstance()
//        let userLocationLayer = mapKit.createUserLocationLayer(with: mapView.mapWindow)
//        userLocationLayer.setVisibleWithOn(true)
//        userLocationLayer.isHeadingEnabled = true

        let markCoordinate = coordinate
        
        let placemark = mapObjects.addPlacemark(with: markCoordinate!)
        placemark.opacity = 1
        placemark.isDraggable = true
        placemark.setIconWith(UIImage(named:"Mark")!)

        
        mapView.mapWindow.map.move(
            with: YMKCameraPosition.init(target: markCoordinate!, zoom: 14, azimuth: 0, tilt: 0),
               animationType: YMKAnimation(type: YMKAnimationType.smooth, duration: 3),
               cameraCallback: nil)
//
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIView.animate(withDuration: 0.4) { [self] in
            containerView.transform = .identity
            self.view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        }
    }
    
    
    func hideContainerView() {
        UIView.animate(withDuration: 0.00001) { [self] in
            
            containerView.transform = CGAffineTransform(translationX: 0, y: containerView.frame.height)
        }
    }
    
    
    @IBAction func dismissButtonTapped(_ sender: Any) {
        UIView.animate(withDuration: 0.4) {
            self.view.alpha = 0
            self.containerView.transform = CGAffineTransform(translationX: 0, y: self.containerView.frame.height)
        } completion: { (_) in
            self.dismiss(animated: true, completion: nil)
        }
    }
    

}

