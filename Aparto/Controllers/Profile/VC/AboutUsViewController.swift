//
//  AboutUsViewController.swift
//  Aparto
//
//  Created by Mac user on 14/09/21.
//

import UIKit

class AboutUsViewController: UIViewController {

    @IBOutlet weak var scrallView: UIScrollView! {
        didSet {
            scrallView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 30, right: 0)
        }
    }
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var telegrammLinkLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var adressLabel: UILabel!
    @IBOutlet weak var workTimeLabel: UILabel!
    @IBOutlet weak var officePhoneNumberLabel: UILabel!
    
    var dataAboutUs: [AboutUs] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDetails()
        Loader.start()
        getData()
    }
    
    func setDetails() {
        navigationItem.leftBarButtonItem?.tintColor = .black
        navigationController?.navigationBar.tintColor = .black
        navigationItem.title = "Контактная информация"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(descriptor: UIFontDescriptor(name: "ProximaNova-Semibold", size: 16), size: 16)]
        removeButtomLineNavigation()
        setBackroundImageForNavigation()
    }
    
    
    func setBackroundImageForNavigation(){
        navigationController?.navigationBar.tintColor = UIColor.black
        navigationController?.navigationBar.barTintColor = UIColor.white
        let img = UIImage(named: "navbar-background")
        navigationController?.navigationBar.setBackgroundImage(img, for: .default)
        navigationItem.largeTitleDisplayMode = .never
        
    }
    
    func removeButtomLineNavigation() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
    }
    
    func getData() {
        if Reachability.isConnectedToNetwork() {
            API.getAboutUs { [self] (data) in
                Loader.stop()
                if let data = data {
                    dataAboutUs = data
                    setData(data: dataAboutUs)
                } else {
                    showErrorAlert(title: "Xatolik", message: "Bog'lanishda xatolik ro'y berdi qayta urinib ko'ring")
                }
            }
        } else {
            AlertNET.showAlert(title: Keys.a_internet, message: Keys.a_goOnline) { (_) in }
        }
        
    }
    
    func setData(data: [AboutUs]) {
        phoneNumberLabel.text = data.first?.phoneNumber
        telegrammLinkLabel.text = data.first?.telegramBot
        emailLabel.text = data.first?.email
        adressLabel.text = data.first?.address
        workTimeLabel.text = data.first?.workTime
        officePhoneNumberLabel.text = data.first?.officePhoneNumber
    }
    
 
    
    @IBAction func phoneNumberBurronTapped(_ sender: Any) {
        callNumber(phoneNumber: dataAboutUs[0].phoneNumber.replacingOccurrences(of: " ", with: ""))
    }
    
    @IBAction func openTelegrammButtonTapped(_ sender: Any) {
        openWithTelegram()
    }
    
    @IBAction func openMailButtonTapped(_ sender: Any) {
        openWithMail()
    }
}

//     MARK: -- makeAPhoneCall

extension AboutUsViewController {
    
    private func callNumber(phoneNumber: String) {
        guard let url = URL(string: "telprompt://\(phoneNumber)"),
            UIApplication.shared.canOpenURL(url) else {
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
}


//     MARK: -- openWithTelegram

extension AboutUsViewController {
    
    func openWithTelegram()  {
        let botURL = URL.init(string: "https://t.me/\(dataAboutUs[0].telegramBot.dropFirst())")
        if UIApplication.shared.canOpenURL(botURL!) {
            UIApplication.shared.openURL(botURL!)
        } else {
          // Telegram is not installed.
            showWarningAlert(title: "Xatolik", message: "Telegram o'rnatilmagan telefoninggizga")
        }
    }
    
}


//     MARK: -- openWithMail

extension AboutUsViewController {
    
    func openWithMail()  {
//        let mailURL = URL(string: )!
//           if UIApplication.shared.canOpenURL(mailURL) {
//               UIApplication.shared.open(mailURL, options: [:], completionHandler: nil)
//           } else {
//            showWarningAlert(title: "Xatolik", message: "Mail o'rnatilmagan telefoninggizga")
//           }
        let appURL = URL(string: "mailto:\(dataAboutUs[0].email)")!

        if #available(iOS 10.0, *) {
            UIApplication.shared.open(appURL, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(appURL)
        }
    }
    
}

