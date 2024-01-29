//
//  ViewController.swift
//  Login Signup Page
//
//  Created by NY on 2024/1/28.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var accountTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var checkTextField: UITextField!
    @IBOutlet weak var checkLabel: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        segmentedChanged(segmentedControl)
        segmentedControl.ensureiOS12Style()
    }

    //MARK: - segmentedControl
    
    @IBAction func segmentedChanged(_ sender: UISegmentedControl) {
        switchSegment()
    }
    
    func switchSegment() {
        accountTextField.text = ""
        passwordTextField.text = ""
        checkTextField.text = ""
        
        let isLoginSegment = segmentedControl.selectedSegmentIndex == 0
        checkTextField.isEnabled = !isLoginSegment
        
        if isLoginSegment {
            checkTextField.backgroundColor = .gray
            checkLabel.textColor = .gray
        } else {
            checkTextField.backgroundColor = .white
            checkLabel.textColor = .black
        }
    }
    
    //MARK: - buttonClick
    
    @IBAction func buttonClick(_sender: UIButton) {
        if segmentedControl.selectedSegmentIndex == 0 {
            switchToLogin()
        } else {
            switchToSignup()
        }
    }
    
    func switchToLogin() {
        let account = accountTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        if account != "appworks_school" || password != "1234" {
            showAlert(title: "Error", message: "Login fail")
        } else {
            showAlert(title: "Login Successfully!", message: "" )
        }
    }
    
    func switchToSignup() {
        let account = accountTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        let checkPassword = checkTextField.text ?? ""
        
        if account.isEmpty {
            showAlert(title: "Error", message: "Account should not be empty.")
        } else if password.isEmpty {
            showAlert(title: "Error", message: "Password should not be empty.")
        } else if checkPassword.isEmpty {
            showAlert(title: "Error", message: "Check Password should not be empty.")
        } else if password != checkPassword {
            showAlert(title: "Error", message: "Signup fail")
        } else {
            showAlert(title: "Signup Successfully!", message: "" )
        }
    }
    
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
}

//MARK: - UISegmentedControl extension

extension UISegmentedControl {
    /// Background color doesn't work on iOS 13.
    func ensureiOS12Style() {
        if #available(iOS 13, *) {
            let tintColorImage = UIImage(color: UIColor.black)

            setBackgroundImage(UIImage(color: backgroundColor ?? .clear), for: .normal, barMetrics: .default)
            setBackgroundImage(tintColorImage, for: .selected, barMetrics: .default)
            setBackgroundImage(UIImage(color: UIColor.black.withAlphaComponent(0.2)), for: .highlighted, barMetrics: .default)
            setBackgroundImage(tintColorImage, for: [.highlighted, .selected], barMetrics: .default)
            
            setTitleTextAttributes([.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13, weight: .regular)], for: .selected)
            setTitleTextAttributes([.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13, weight: .regular)], for: .normal)
            
            setDividerImage(tintColorImage, forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
            layer.borderWidth = 1
            layer.borderColor = UIColor.black.cgColor
        }
    }
}

public extension UIImage {
    convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
    let rect = CGRect(origin: .zero, size: size)
    UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
    color.setFill()
    UIRectFill(rect)
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()

    guard let cgImage = image?.cgImage else { return nil }
    self.init(cgImage: cgImage)
  }
}
