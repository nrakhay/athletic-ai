//
//  RegistrationVC.swift
//  athletic-ai
//
//  Created by Nurali Rakhay on 14.06.2023.
//

import UIKit

final class RegistrationVC: UIViewController {
    private var headerTopLabel = UILabel()
    private var headerBottomLabel = UILabel()
    
    private var stackView = UIStackView()
    private var firstNameInput = InputFieldView()
    private var lastNameInput = InputFieldView()
    private var emailInput = InputFieldView()
    private var passwordInput = InputFieldView()
    private var validationLabel = UILabel()
    
    private var registerButton = UIButton()
    
    private var orLabel = UILabel()
    private var authView = UIView()
    private var leftLineImage = UIImageView()
    private var rightLineImage = UIImageView()
    private var googleButton = UIButton()
    private var appleButton = UIButton()
    
    private var footerLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.hidesBackButton = true
        self.hideKeyboardWhenTappedAround()
        
        view.addSubviews(headerTopLabel, headerBottomLabel, footerLabel, authView, orLabel, leftLineImage, rightLineImage, registerButton, stackView, validationLabel)
        authView.addSubviews(googleButton, appleButton)
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        configureTopLabel()
        configureBottomLabel()
        configureStackView()
        configureValidationLabel()
        configureRegisterButton()
        configureOrLabel()
        configureAuthView()
        configureGoogleButton()
        configureAppleButton()
        configureLineImages()
        configureFooterLabel()
    }
    
    @objc private func registerTapped() {
        if let text = firstNameInput.getText() {
            print(text)
        }
        
        let vc = InitialSetupVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func appleTapped() {
        
    }
    
    @objc private func googleTapped() {
        
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

    private func configureTopLabel() {
        headerTopLabel.text = RegistrationTexts.headerTopText
        headerTopLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        headerTopLabel.centerX(in: view, top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 24)
    }
    
    private func configureBottomLabel() {
        headerBottomLabel.text = RegistrationTexts.headerBottomText
        headerBottomLabel.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        headerBottomLabel.centerX(in: view, top: headerTopLabel.bottomAnchor, paddingTop: 4)
    }
    
    private func configureStackView() {
        stackView.addArrangedSubviews(firstNameInput, lastNameInput, emailInput, passwordInput)
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.anchor(top: headerBottomLabel.bottomAnchor, paddingTop: 45, width: view.width * 0.8, height: 300)
        stackView.centerX(in: view)
        configureInputFields()
        
    }
    
    private func configureValidationLabel() {
        validationLabel.anchor(top: passwordInput.bottomAnchor, left: passwordInput.leftAnchor, paddingTop: -15)
        validationLabel.textColor = .red
        validationLabel.isHidden = true
    }
    
    private func configureInputFields() {
        firstNameInput.configure(with: .init(text: RegistrationTexts.firstName, iconName: IconNames.personIcon, width: view.width * 0.8, height: 50))
        lastNameInput.configure(with: .init(text: RegistrationTexts.lastName, iconName: IconNames.personIcon, width: view.width * 0.8, height: 50))
        emailInput.configure(with: .init(text: RegistrationTexts.email, iconName: IconNames.mailIcon, width: view.width * 0.8, height: 50))
        passwordInput.configure(with: .init(text: RegistrationTexts.password, iconName: IconNames.keyIcon, width: view.width * 0.8, height: 50))
    }
    
    private func configureRegisterButton() {
        registerButton.setTitle(RegistrationTexts.register, for: .normal)
        registerButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        registerButton.backgroundColor = .systemBlue
        registerButton.setTitleColor(.white, for: .normal)
        registerButton.layer.cornerRadius = 24
        registerButton.addTarget(self, action: #selector(registerTapped), for: .touchUpInside)
        
        registerButton.centerX(in: view, bottom: orLabel.topAnchor, paddingBottom: 10)
        registerButton.anchor(width: 0.8 * view.width, height: 50)
    }
    
    private func configureOrLabel() {
        orLabel.text = RegistrationTexts.orText
        orLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        orLabel.centerX(in: view, bottom: authView.topAnchor, paddingBottom: 10)
    }
    
    private func configureLineImages() {
        leftLineImage.image = UIImage(named: IconNames.thinLine)
        leftLineImage.anchor(right: orLabel.leftAnchor, paddingRight: 12)
        leftLineImage.centerY(in: orLabel)

        rightLineImage.image = UIImage(named: IconNames.thinLine)
        rightLineImage.anchor(left: orLabel.rightAnchor, paddingLeft: 12)
        rightLineImage.centerY(in: orLabel)
    }

    private func configureAuthView() {
        authView.anchor(bottom: footerLabel.topAnchor, paddingBottom: 12, width: view.width, height: 40)
    }
    
    private func configureGoogleButton() {
        googleButton.anchor(right: view.centerXAnchor, paddingRight: 15, width: 36, height: 36)
        googleButton.centerY(in: authView)
        
        googleButton.setImage(UIImage(named: IconNames.googleLogo), for: .normal)
        googleButton.contentVerticalAlignment = .fill
        googleButton.contentHorizontalAlignment = .fill
        
        googleButton.addTarget(self, action: #selector(googleTapped), for: .touchUpInside)
    }
    
    private func configureAppleButton() {
        appleButton.anchor(left: view.centerXAnchor, paddingLeft: 15, width: 36, height: 36)
        appleButton.centerY(in: authView)
        
        appleButton.setImage(UIImage(named: IconNames.appleLogo), for: .normal)
        appleButton.contentVerticalAlignment = .fill
        appleButton.contentHorizontalAlignment = .fill
        
        appleButton.addTarget(self, action: #selector(appleTapped), for: .touchUpInside)
    }
    
    private func configureFooterLabel() {
        let completeText = RegistrationTexts.bottomText
        let targetText = "Login"
        let targetColor = UIColor.systemBlue
        footerLabel.attributedText = Helper.makeAttributedString(text: completeText, targetString: targetText, color: targetColor)
        
        footerLabel.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        footerLabel.centerX(in: view, bottom: view.safeAreaLayoutGuide.bottomAnchor, paddingBottom: 12)
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
