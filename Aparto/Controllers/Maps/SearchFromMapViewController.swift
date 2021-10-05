//
//  SearchFromMapViewController.swift
//  Aparto
//
//  Created by Mac user on 03/10/21.
//

import UIKit
import YandexMapsMobile

class SearchFromMapViewController: UIViewController {

    @IBOutlet weak var mapView: YMKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let mapKit = YMKMapKit.sharedInstance()
        let userLocationLayer = mapKit.createUserLocationLayer(with: mapView.mapWindow)
        userLocationLayer.setVisibleWithOn(true)
        userLocationLayer.isHeadingEnabled = true
        
//        mapView.mapWindow.map.move(
//               with: YMKCameraPosition.init(target: YMKPoint(latitude: 41.311081, longitude: 69.240562), zoom: 14, azimuth: 0, tilt: 0),
//               animationType: YMKAnimation(type: YMKAnimationType.smooth, duration: 3),
//               cameraCallback: nil)
        
    }
    
    

}
