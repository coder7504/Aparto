//
//  CustomTextFieldView.swift
//  Aparto
//
//  Created by Asliddin Mahmudov on 9/24/21.
//

import Foundation
import UIKit



class CustomTextFieldView: UIView {
    
    
    
    
    fileprivate var topLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Keys.semibold, size: 14)
        label.textColor = .black
        return label
    }()
    
    
    var titleLabel: UITextField = {
        let label = UITextField()
        label.font = UIFont(name: Keys.semibold, size: 16)
        label.returnKeyType = UIReturnKeyType.done
        label.keyboardType = UIKeyboardType.default
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
    
    fileprivate var rightImageButton: UIButton = {
        let b = UIButton()
        b.setImage(#imageLiteral(resourceName: "arrowRight"), for: .normal)
        return b
    }()
    
    fileprivate let backStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.alignment = .center
        return stack
    }()
    
    let openTextFieldButton: UIButton = {
       let b = UIButton()
        b.setTitle("", for: .normal)
        return b
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
                if !title.isEmpty {
                    labelStack.insertArrangedSubview(titleLabel, at: 1)
                    topLabel.textColor = .gr
                    topLabel.font = UIFont(name: Keys.semibold, size: 14)
                }
            }
        }
    }
    
    var rightImage: UIImage? {
        get {
            return rightImageButton.currentImage
        }
        set (image){
            if let img = image {
                rightImageButton.setImage(img, for: .normal)
            }else {
                rightImageButton.setImage(UIImage(named: "arrow-right"), for: .normal)
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
        
        rightImageButton.isEnabled = false
        rightImageButton.addTarget(self, action: #selector(reightButtonTApped), for: .touchUpInside)
        
        openTextFieldButton.addTarget(self, action: #selector(openTextFieldTapped), for: .touchUpInside)
        
//        let bar = UIToolbar()
//        let reset = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(resetTapped))
//        reset.tintColor = .black
//        bar.items = [UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil),reset]
//        bar.sizeToFit()
//        titleLabel.inputAccessoryView = bar
        
        titleLabel.keyboardToolbar.doneBarButton.setTarget(self, action: #selector(resetTapped))

        
        titleLabel.delegate = self
        clipsToBounds = true
        layer.cornerRadius = 6
        backgroundColor = .hovered
        addSubview(backStack)
        backStack.addArrangedSubview(labelStack)
        backStack.addArrangedSubview(rightImageButton)
        
        backStack.translatesAutoresizingMaskIntoConstraints = false
        backStack.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        backStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        backStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        backStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16).isActive = true
        
        rightImageButton.translatesAutoresizingMaskIntoConstraints = false
        rightImageButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        rightImageButton.widthAnchor.constraint(equalToConstant: 15).isActive = true
        
        addSubview(openTextFieldButton)
        
        openTextFieldButton.translatesAutoresizingMaskIntoConstraints = false
        openTextFieldButton.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        openTextFieldButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        openTextFieldButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        openTextFieldButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        
    }
    
    @objc func resetTapped() {
        titleLabel.resignFirstResponder()
        if titleLabel.text!.isEmpty {
            titleLabel.isHidden = true
            topLabel.textColor = .black
            topLabel.font = UIFont(name: Keys.semibold, size: 16)
        }
    }
    
    @objc func openTextFieldTapped() {
        titleLabel.becomeFirstResponder()
        titleLabel.isHidden = false
        topLabel.textColor = .gr
        topLabel.font = UIFont(name: Keys.semibold, size: 14)
        labelStack.insertArrangedSubview(titleLabel, at: 1)
    }
    
    @objc func reightButtonTApped() {
        print("rightImage")
    }
    
}


extension CustomTextFieldView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
}
