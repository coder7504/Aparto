//
//  CustomView.swift
//  Aparto
//
//  Created by Shahzod Ashirov on 11/09/21.
//

import UIKit


class CustomView: UIView {
    
    
    
    
    fileprivate var topLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Keys.semibold, size: 14)
        label.textColor = #colorLiteral(red: 0.5529411765, green: 0.5960784314, blue: 0.6156862745, alpha: 1)
        return label
    }()
    
    
    fileprivate var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Keys.semibold, size: 16)
        label.textColor = .black
        return label
    }()
    
    
    fileprivate let labelStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = 6
        stack.alignment = .fill
        return stack
    }()
    
    fileprivate var chevronImage: UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "arrowRight")
        return image
    }()
    
    fileprivate let backStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.alignment = .center
        return stack
    }()
    
    
    var topTitle: String? {
        get {
            return topLabel.text
        }
        set (newValue) {
            if let title = newValue {
                topLabel.text = title
                labelStack.insertArrangedSubview(topLabel, at: 0)
            }
        }
    }
    
    var mainTitle: String? {
        get {
            return titleLabel.text
        }
        set (newValue) {
            if let title = newValue {
                titleLabel.text = title
                labelStack.insertArrangedSubview(titleLabel, at: 1)
            }
        }
    }
    
    var rightImage: UIImage? {
        get {
            return chevronImage.image
        }
        set (image){
            if let img = image {
                chevronImage.image = img
            }else {
                chevronImage.image = UIImage(named: "arrow-right")
            }
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
    }
    
    
    
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setUI()
    }
    
    
    
    
    
    fileprivate func setUI() {
        
        clipsToBounds = true
        layer.cornerRadius = 6
        backgroundColor = .hovered
        addSubview(backStack)
        backStack.addArrangedSubview(labelStack)
        backStack.addArrangedSubview(chevronImage)
        
        backStack.translatesAutoresizingMaskIntoConstraints = false
        backStack.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        backStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        backStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        backStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16).isActive = true
        
        chevronImage.translatesAutoresizingMaskIntoConstraints = false
        chevronImage.heightAnchor.constraint(equalToConstant: 20).isActive = true
        chevronImage.widthAnchor.constraint(equalToConstant: 15).isActive = true
    }
    
    
}
