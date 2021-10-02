//
//  TestTabButton.swift
//  EYViewPager
//
//  Copyright © 2016 ww.otkur.biz. All rights reserved.
//

import Foundation
import UIKit
class WormTabStripButton: UILabel {
    
    var index: Int?
    var paddingToEachSide: CGFloat = 5
    var tabText: NSString? {
        didSet{
            let textSize:CGSize = tabText!.size(withAttributes: [NSAttributedString.Key.font: UIFont(name: "ProximaNova-Semibold", size: 12)])
            self.frame.size.width = textSize.width + paddingToEachSide + paddingToEachSide
            
            self.text = String(tabText!)
        }
    }
   
    //MARK: init
    override init(frame: CGRect) {
        super.init(frame: frame)
        font = UIFont(name: "ProximaNova-Semibold", size: 12)
    }
    
    convenience required init(key: String) {
        self.init(frame:CGRect.zero)
        font = UIFont(name: "ProximaNova-Semibold", size: 12)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
