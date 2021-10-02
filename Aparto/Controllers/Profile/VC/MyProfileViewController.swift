//
//  MyProfileViewController.swift
//  Aparto
//
//  Created by Mac user on 13/09/21.
//

import UIKit

class MyProfileViewController: UIViewController {
    
    @IBOutlet weak var phoneNumberLabel: UILabel! {
        didSet {
            phoneNumberLabel.text = Cache.getUserPhoneNumber()
        }
    }
    
    @IBOutlet weak var nameView: CustomTextFieldView! {
        didSet {
            nameView.topTitle = "Имя"
            nameView.mainTitle = Cache.getUserName()
            nameView.rightImage = nil
        }
    }
    
    @IBOutlet weak var surnameView: CustomTextFieldView! {
        didSet {
            surnameView.topTitle = "Фамилия"
            surnameView.mainTitle = Cache.getUserSurname()
            surnameView.rightImage = nil
        }
    }
    
    @IBOutlet weak var genderView: CustomTextFieldView! {
        didSet {
            genderView.topTitle = "Пол"
            genderView.mainTitle = Cache.getUserGender()
        }
    }
    
    @IBOutlet weak var emailView: CustomTextFieldView! {
        didSet {
            emailView.topTitle = "Почта"
            emailView.mainTitle = Cache.getUserEmail()
            emailView.rightImage = nil
        }
    }
        
    @IBOutlet weak var dateView: CustomTextFieldView! {
        didSet {
            dateView.topTitle = "День рождения"
            dateView.mainTitle = Cache.getUserBirthday()
        }
    }
    
    let datePicker = UIDatePicker()
    let genderTitle = ["Male","Female"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDetails()
        setGenderPickerView()
        if #available(iOS 13.4, *) {
            setDatePicker()
        } else {
            // Fallback on earlier versions
        }
        Cache.save(_id: "614f8eeb7a9b2153bfffcf98")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        phoneNumberLabel.text = Cache.getUserPhoneNumber()
        nameView.mainTitle = Cache.getUserName()
        surnameView.mainTitle = Cache.getUserSurname()
        genderView.mainTitle = Cache.getUserGender()
        emailView.mainTitle = Cache.getUserEmail()
        dateView.mainTitle = Cache.getUserBirthday()
    }
    
    func setDatePicker() {
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(changeDatePicker), for: UIControl.Event.valueChanged)
        datePicker.frame.size = CGSize(width: 0, height: 300)
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        } else {
            // Fallback on earlier versions
        }
        
        dateView.titleLabel.inputView = datePicker
        dateView.titleLabel.text = dateFormat(date: datePicker.date)
    }
    
    @objc func changeDatePicker() {
        dateView.titleLabel.text = dateFormat(date: datePicker.date)
        Cache.saveUser(birthday: dateFormat(date: datePicker.date))
    }
    
    func dateFormat(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd"
        return formatter.string(from: date)
    }
    
    func setGenderPickerView() {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        genderView.titleLabel.inputView = pickerView
    }
    
    func setDetails() {
        navigationController?.navigationBar.tintColor = UIColor.black
        navigationItem.leftBarButtonItem?.tintColor = .black
        navigationItem.title = "Мой профиль"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(descriptor: UIFontDescriptor(name: "ProximaNova-Semibold", size: 16), size: 16)]
        removeButtomLineNavigation()
        setBackroundImageForNavigation()
    }
    
    func setBackroundImageForNavigation(){
        navigationController?.navigationBar.barTintColor = UIColor.white
        let img = UIImage(named: "navbar-background")
        navigationController?.navigationBar.setBackgroundImage(img, for: .default)
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.backButtonTitle = ""
        navigationItem.backBarButtonItem?.tintColor = .black
    }
    
    func removeButtomLineNavigation() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
    }
    
    func saveData() {
        Cache.saveUser(surname: surnameView.mainTitle!)
        Cache.saveUser(name: nameView.mainTitle!)
        Cache.saveUser(email: emailView.mainTitle!)
    }
    
    @IBAction func editButtonTapped(_ sender: Any) {
        let vc = EditPhoneNumberViewController(nibName: "EditPhoneNumberViewController", bundle: nil)
        vc.hidesBottomBarWhenPushed = false
        saveData()
        vc.oldNum = phoneNumberLabel.text!
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        if Reachability.isConnectedToNetwork() {
            
            API.updateUser( birthday: Cache.getUserBirthday()!, gender: Cache.getUserGender()!, phoneNumber: Cache.getUserPhoneNumber()!,name: nameView.mainTitle!, surname: surnameView.mainTitle!, email: emailView.mainTitle!) { [self] (isSaved) in
                guard let isSaved = isSaved else { return }
                if isSaved {
                    saveData()
                    navigationController?.popViewController(animated: true)
                } else {
                    AlertNET.showAlert(title: Keys.a_internet, message: "Ma'lumotlarni saqlashda xatolik. Iltimos qaytadan urunib ko'ring.") { (_) in }
                }
            }
        } else {
            showErrorAlert(title: Keys.a_internet, message: Keys.a_goOnline)
        }
                
    }
    
    
    
}


extension MyProfileViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        genderTitle.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        genderView.titleLabel.text = genderTitle[row]
        Cache.saveUser(gender: genderTitle[row])

    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        genderTitle[row]
    }
    
}
