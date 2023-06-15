//
//  RegistrationVC.swift
//  athletic-ai
//
//  Created by Nurali Rakhay on 14.06.2023.
//

import UIKit

final class RegistrationVC: UIViewController {
    
    enum Texts {
        static let headerTopText = "Hey, let's"
        static let headerBottomText = "Create an Account"
        static let firstName = "First Name"
        static let secondName = "Second Name"
        static let email = "Email"
        static let password = "Password"
        static let register = "Register"
        static let bottomText = "Already have an account? Login"
    }
    
    enum IconNames {
        static let googleLogo = "google-logo"
        static let appleLogo = "apple-logo"
        static let thinLine = "thin-line"
        static let personIcon = "person-icon"
        static let mailIcon = "mail-icon"
        static let keyIcon = "key-icon"
    }
    
    private var headerTopLabel = UILabel()
    private var headerBottomLabel = UILabel()
    
    private var stackView = UIStackView()
    private var firstNameInput = InputFieldView()
    private var secondNameInput = InputFieldView()
    private var emailInput = InputFieldView()
    private var passwordInput = InputFieldView()
    
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
        
        view.addSubviews(headerTopLabel, headerBottomLabel, footerLabel, authView, orLabel, leftLineImage, rightLineImage, registerButton, stackView)
        authView.addSubviews(googleButton, appleButton)
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        configureTopLabel()
        configureBottomLabel()
        configureStackView()
        configureRegisterButton()
        configureOrLabel()
        configureAuthView()
        configureGoogleButton()
        configureAppleButton()
        configureLineImages()
        configureFooterLabel()
        
//        input.anchor(top: headerBottomLabel.bottomAnchor, paddingTop: 20, width: 320, height: 45)
//        input.centerX(in: view)
//
//        input.configure(with: .init(text: "Hello", iconName: "person-icon", width: view.width * 0.8, height: 50))
    }
    
    @objc private func registerTapped() {
        
    }
    
    @objc private func appleTapped() {
        
    }
    
    @objc private func googleTapped() {
        
    }
    
    private func configureTopLabel() {
        headerTopLabel.text = Texts.headerTopText
        headerTopLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        headerTopLabel.centerX(in: view, top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 24)
    }
    
    private func configureBottomLabel() {
        headerBottomLabel.text = Texts.headerBottomText
        headerBottomLabel.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        headerBottomLabel.centerX(in: view, top: headerTopLabel.bottomAnchor, paddingTop: 4)
    }
    
    private func configureStackView() {
        stackView.addArrangedSubview(firstNameInput)
        stackView.addArrangedSubview(secondNameInput)
        stackView.addArrangedSubview(emailInput)
        stackView.addArrangedSubview(passwordInput)
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.anchor(top: headerBottomLabel.bottomAnchor, paddingTop: 45, width: view.width * 0.8, height: 300)
        stackView.centerX(in: view)
        configureInputFields()
        
    }
    
    private func configureInputFields() {
        firstNameInput.configure(with: .init(text: Texts.firstName, iconName: IconNames.personIcon, width: view.width * 0.8, height: 50))
        secondNameInput.configure(with: .init(text: Texts.secondName, iconName: IconNames.personIcon, width: view.width * 0.8, height: 50))
        emailInput.configure(with: .init(text: Texts.email, iconName: IconNames.mailIcon, width: view.width * 0.8, height: 50))
        passwordInput.configure(with: .init(text: Texts.password, iconName: IconNames.keyIcon, width: view.width * 0.8, height: 50))
    }
    
    private func configureRegisterButton() {
        registerButton.setTitle(Texts.register, for: .normal)
        registerButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        registerButton.backgroundColor = .systemBlue
        registerButton.setTitleColor(.white, for: .normal)
        registerButton.layer.cornerRadius = 24
        
        registerButton.addTarget(self, action: #selector(registerTapped), for: .touchUpInside)
        
        registerButton.centerX(in: view, bottom: orLabel.topAnchor, paddingBottom: 10)
        registerButton.anchor(width: 0.8 * view.width, height: 50)
    }
    
    private func configureOrLabel() {
        orLabel.text = "Or"
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
        googleButton.anchor(right: view.centerXAnchor, paddingRight: 15, width: 40, height: 40)
        googleButton.centerY(in: authView)
        
        googleButton.setImage(UIImage(named: IconNames.googleLogo), for: .normal)
        googleButton.contentVerticalAlignment = .fill
        googleButton.contentHorizontalAlignment = .fill
        
        googleButton.addTarget(self, action: #selector(googleTapped), for: .touchUpInside)
    }
    
    private func configureAppleButton() {
        appleButton.anchor(left: view.centerXAnchor, paddingLeft: 15, width: 42, height: 42)
        appleButton.centerY(in: authView)
        
        appleButton.setImage(UIImage(named: IconNames.appleLogo), for: .normal)
        appleButton.contentVerticalAlignment = .fill
        appleButton.contentHorizontalAlignment = .fill
        
        appleButton.addTarget(self, action: #selector(appleTapped), for: .touchUpInside)
    }
    
    private func configureFooterLabel() {
        let completeText = Texts.bottomText
        let targetText = "Login"
        let targetColor = UIColor.systemBlue
        footerLabel.attributedText = Helper.makeAttributedString(text: completeText, targetString: targetText, color: targetColor)
        
        footerLabel.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        footerLabel.centerX(in: view, bottom: view.safeAreaLayoutGuide.bottomAnchor, paddingBottom: 12)
    }
}
