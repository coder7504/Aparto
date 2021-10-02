//
//  CustomBtn.swift
//  Aparto
//
//  Created by Shahzod Ashirov on 11/09/21.
//

import UIKit


class CustomBtn: UIButton {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setup()
    }
    
    
    
    
    fileprivate func setup() {
        backgroundColor = .main
        clipsToBounds = true
        self.titleLabel?.font = UIFont(name: "ProximaNova-Semibold", size: 16)
        layer.cornerRadius = 12
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont(name: Keys.semibold, size: 16)
    }
    
}
