//
//  Colors.swift
//  Aparto
//
//  Created by Shahzod Ashirov on 09/09/21.
//

import UIKit

extension UIColor {
    
    static let main = #colorLiteral(red: 0.03921568627, green: 0.5137254902, blue: 0.4235294118, alpha: 1)
    static let orangeCustom = #colorLiteral(red: 0.9450980392, green: 0.5215686275, blue: 0.1294117647, alpha: 1)
    static let hovered = #colorLiteral(red: 0.9568627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
    static let gr = #colorLiteral(red: 0.5529411765, green: 0.5960784314, blue: 0.6156862745, alpha: 1)
    static let tabBar = #colorLiteral(red: 0.9764705882, green: 0.9764705882, blue: 0.9764705882, alpha: 0.94)
    static let unSelected = #colorLiteral(red: 0.137254902, green: 0.1215686275, blue: 0.1254901961, alpha: 1)
    
}


extension CGColor {
    
    static let main = #colorLiteral(red: 0.03921568627, green: 0.5137254902, blue: 0.4235294118, alpha: 1)
    static let orangeCustom = #colorLiteral(red: 0.9450980392, green: 0.5215686275, blue: 0.1294117647, alpha: 1)
    static let hovered = #colorLiteral(red: 0.9568627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
    static let gr = #colorLiteral(red: 0.5529411765, green: 0.5960784314, blue: 0.6156862745, alpha: 1)
    static let tabBar = #colorLiteral(red: 0.9764705882, green: 0.9764705882, blue: 0.9764705882, alpha: 0.94)
    
    
}


//   MARK: --  extension String

extension String {
    
    func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
    
    
    func heightOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.height
    }
    
}


//MARK: - Returns boolean, whether small screen or not
extension UIViewController {
    
    var isSmallScreen : Bool {
        UIScreen.main.bounds.height < 800
    }
    
    func presentAnimationForVC(container vc: UIView) {
        view.backgroundColor = .clear
        vc.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        vc.alpha = 0
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut) {
            self.view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.3037283184)
            vc.transform = .identity
            vc.alpha = 1
        }
    }
    
    func dismissAnimationForVC(container vc: UIView, completion: (()->Void)? = nil) {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut) {
            self.view.backgroundColor = .clear
            vc.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            vc.alpha = 0
        } completion: { (_) in
            if completion != nil {
                completion!()
            }
        }
    }
    
    func showErrorAlert(title: String, message: String, completion: (() -> Void)? = nil) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .destructive) { (action) in
            if let _ = completion {
                completion!()
            }
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
    func showWarningAlert(title: String, message: String, completion: (() -> Void)? = nil) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { (action) in
            if let _ = completion {
                completion!()
            }
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
    
    func translateTitle(title: Population) -> String {
        switch Cache.getAppLanguage() {
        case .uz: return title.uz
        case .ru: return title.ru
        case .en: return title.en
        }
    }
    
    func convertToOrdinary(fromJSForm date: String) -> String {
          
          let formatter = DateFormatter()
          formatter.dateFormat = "dd / MM / yyyy"
          
          //"yyyy-MM-dd'T'HH:mm:ssZ"
          
          let iso8601DateFormatter = ISO8601DateFormatter()
          iso8601DateFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
          
          if let dat = iso8601DateFormatter.date(from: date) {
              return formatter.string(from: dat)
          } else {
              return ""
          }
          
      }
    
    //
    //    //    MARK: -- Scroll Direction
    //
    //    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
    //        if(scrollView.panGestureRecognizer.translation(in: scrollView.superview).y > 0) {
    //            UIView.animate(withDuration: 0.3) {
    //                self.hideStackView.transform = .identity
    //                self.hideStackView.isHidden = false
    //            }
    //        }
    //        else {
    //            UIView.animate(withDuration: 0.3) {
    //                self.hideStackView.isHidden = true
    //                self.hideStackView.transform = CGAffineTransform(translationX: 0, y: -200)
    //            }
    //        }
    //    }
    //
    
}


