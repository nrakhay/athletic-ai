//
//  RegistrationVC.swift
//  athletic-ai
//
//  Created by Nurali Rakhay on 14.06.2023.
//

import UIKit

final class RegistrationVC: UIViewController, Coordinating {
    var coordinator: Coordinator?
    
    lazy var registrationView = RegistrationView()
    
    override func loadView() {
        self.view = registrationView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registrationView.delegate = self
        
        self.hideKeyboardWhenTappedAround()
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        navigationItem.hidesBackButton = true
    }

    
//    private func validate(_ textField: UITextField) -> (Bool, String?) {
//        guard let text = textField.text else {
//            return (false, nil)
//        }
//
//        if textField == passwordInput {
//            return (text.count >= 6, "Your password is too short.")
//        }
//
//        return (text.count > 0, "This field cannot be empty.")
//    }
    
}


extension RegistrationVC: RegistrationViewDelegate {
    func googleTapped() {
        coordinator?.eventOccured(with: .registerTapped)
    }
    
    func appleTapped() {
        
    }
    
    func registerTapped() {
        
    }
}


//extension RegistrationVC: UITextFieldDelegate {
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        switch textField {
//        case firstNameInput:
//            lastNameInput.customBecomeFirstResponder()
//        case lastNameInput:
//            emailInput.customBecomeFirstResponder()
//        case emailInput:
//            passwordInput.customBecomeFirstResponder()
//        default:
//            let (valid, message) = validate(textField)
//
//            if valid {
//                passwordInput.customResignFirstResponder()
//            }
//
//            self.validationLabel.text = message
//
//            UIView.animate(withDuration: 0.25, animations: {
//                            self.validationLabel.isHidden = valid
//                        })
//        }
//
//        return true
//    }
//}
