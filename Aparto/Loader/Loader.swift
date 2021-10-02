//
//  Loader.swift
//  MyGruzUz
//
//  Created by Nodirbek Asqarov on 8/31/19.
//  Copyright © 2019 Nodirbek Asqarov. All rights reserved.
//

import UIKit
import Lottie


public class Loader {
    
    ///Shows custom Alert for a while
    class func start() {

        let loadV = UIView()
        loadV.tag = 19995
        loadV.backgroundColor = .clear
        loadV.frame = UIScreen.main.bounds
        let customView = AnimationView()
        customView.frame = CGRect(x: 0, y: 0, width: 70, height: 70)
        customView.clipsToBounds = true
        customView.layer.cornerRadius = 20
        loadV.addSubview(customView)
        
        customView.translatesAutoresizingMaskIntoConstraints = false
        customView.centerXAnchor.constraint(equalTo: loadV.centerXAnchor).isActive = true
        customView.centerYAnchor.constraint(equalTo: loadV.centerYAnchor).isActive = true
        customView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        customView.widthAnchor.constraint(equalToConstant: 70).isActive = true
        
        
        customView.backgroundColor = #colorLiteral(red: 0.9089154005, green: 0.9138393998, blue: 0.9223169684, alpha: 1)
        UIApplication.shared.keyWindow?.addSubview(loadV)
        customView.animation = Animation.named("pulse")
        customView.animationSpeed = 2.0
        customView.loopMode = .loop
        customView.play()
        
    }
    
    
    
    class func stop() {
        for i in UIApplication.shared.keyWindow!.subviews {
            if i.tag == 19995 {
                UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn) {
                    i.alpha = 0
                } completion: { (_) in
                    i.removeFromSuperview()
                }
            }
        }
    }
}




