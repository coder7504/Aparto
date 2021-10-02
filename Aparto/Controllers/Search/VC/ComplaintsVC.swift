//
//  ComplaintsVC.swift
//  Aparto
//
//  Created by Shahzod Ashirov on 14/09/21.
//

import UIKit

class ComplaintsVC: UIViewController {

    
    private let complaintLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Keys.semibold, size: 18)
        label.text = "Причина жалобы"
        return label
    }()
    
    
    private let cancelBtn: UIButton = {
        let btn = UIButton()
        btn.titleLabel?.font = UIFont(name: Keys.regular, size: 14)
        btn.setTitle("отмена", for: .normal)
        btn.setTitleColor(.main, for: .normal)
        btn.addTarget(self, action: #selector(didTapCancel(_:)), for: .touchUpInside)
        return btn
    }()
        
    
    fileprivate let topStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.alignment = .fill
        return stack
    }()
        
      
    private let textView: UITextView = {
        let view = UITextView()
        view.backgroundColor = .hovered
        view.clipsToBounds = true
        view.layer.cornerRadius = 12
        view.font = UIFont(name: Keys.regular, size: 16)
        view.textColor = .gr
        view.text = "Впишите причину жалобы тут"
        return view
    }()
        
    
    private let sendBtn: CustomBtn = {
        let btn = CustomBtn()
        btn.setTitle("Отправить", for: .normal)
        btn.addTarget(self, action: #selector(didTapSend(_:)), for: .touchUpInside)
        return btn
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setUI()
        textView.delegate = self
    }
    
    
    @objc func didTapCancel(_ sender: UIButton) {
        print("GJ")
    }
    
    @objc func didTapSend(_ sender: UIButton) {
        print("Send Tap tap")
    }
    
    
    
    fileprivate func setUI() {
        view.addSubview(topStack)
        topStack.translatesAutoresizingMaskIntoConstraints = false
        topStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        topStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        topStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        topStack.addArrangedSubview(complaintLabel)
        topStack.addArrangedSubview(cancelBtn)
        
        view.addSubview(textView)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.topAnchor.constraint(equalTo: topStack.bottomAnchor, constant: 10).isActive = true
        textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        textView.heightAnchor.constraint(equalToConstant: view.frame.height/3).isActive = true
        
        view.addSubview(sendBtn)
        sendBtn.translatesAutoresizingMaskIntoConstraints = false
        sendBtn.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 24).isActive = true
        sendBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        sendBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        sendBtn.heightAnchor.constraint(equalToConstant: 47).isActive = true
    }
    

}


extension ComplaintsVC: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
    }
}
