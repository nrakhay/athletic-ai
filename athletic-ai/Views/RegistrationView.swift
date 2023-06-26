//
//  RegistrationView.swift
//  athletic-ai
//
//  Created by Nurali Rakhay on 26.06.2023.
//

import UIKit

protocol RegistrationViewDelegate {
    func registerTapped()
    func googleTapped()
    func appleTapped()
}

class RegistrationView: UIView {
    var delegate: RegistrationViewDelegate?
    
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
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.backgroundColor = .systemBackground
        
        self.addSubviews(headerTopLabel, headerBottomLabel, footerLabel, authView, orLabel, leftLineImage, rightLineImage, registerButton, stackView, validationLabel)
        authView.addSubviews(googleButton, appleButton)
        
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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureTopLabel() {
        headerTopLabel.text = RegistrationTexts.headerTopText
        headerTopLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        headerTopLabel.centerX(in: self, top: self.safeAreaLayoutGuide.topAnchor, paddingTop: 24)
    }
    
    private func configureBottomLabel() {
        headerBottomLabel.text = RegistrationTexts.headerBottomText
        headerBottomLabel.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        headerBottomLabel.centerX(in: self, top: headerTopLabel.bottomAnchor, paddingTop: 4)
    }
    
    private func configureStackView() {
        stackView.addArrangedSubviews(firstNameInput, lastNameInput, emailInput, passwordInput)
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.anchor(top: headerBottomLabel.bottomAnchor, paddingTop: 45, width: self.width * 0.8, height: 300)
        stackView.centerX(in: self)
        configureInputFields()
        
    }
    
    private func configureValidationLabel() {
        validationLabel.anchor(top: passwordInput.bottomAnchor, left: passwordInput.leftAnchor, paddingTop: -15)
        validationLabel.textColor = .red
        validationLabel.isHidden = true
    }
    
    private func configureInputFields() {
        firstNameInput.configure(with: .init(text: RegistrationTexts.firstName, width: WindowDimensions.width * 0.8, height: 50))
        lastNameInput.configure(with: .init(text: RegistrationTexts.lastName, width: WindowDimensions.width * 0.8, height: 50))
        emailInput.configure(with: .init(text: RegistrationTexts.email, width: WindowDimensions.width * 0.8, height: 50))
        passwordInput.configure(with: .init(text: RegistrationTexts.password, width: WindowDimensions.width * 0.8, height: 50))
    }
    
    private func configureRegisterButton() {
        registerButton.setTitle(RegistrationTexts.register, for: .normal)
        registerButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        registerButton.backgroundColor = .systemBlue
        registerButton.setTitleColor(.white, for: .normal)
        registerButton.layer.cornerRadius = 24
        registerButton.addTarget(self, action: #selector(registerTapped), for: .touchUpInside)
        
        registerButton.centerX(in: self, bottom: orLabel.topAnchor, paddingBottom: 10)
        registerButton.anchor(width: 0.8 * WindowDimensions.width, height: 50)
    }
    
    private func configureOrLabel() {
        orLabel.text = RegistrationTexts.orText
        orLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        orLabel.centerX(in: self, bottom: authView.topAnchor, paddingBottom: 10)
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
        authView.anchor(bottom: footerLabel.topAnchor, paddingBottom: 12, width: WindowDimensions.width, height: 40)
    }
    
    private func configureGoogleButton() {
        googleButton.anchor(right: self.centerXAnchor, paddingRight: 15, width: 36, height: 36)
        googleButton.centerY(in: authView)
        
        googleButton.setImage(UIImage(named: IconNames.googleLogo), for: .normal)
        googleButton.contentVerticalAlignment = .fill
        googleButton.contentHorizontalAlignment = .fill
        
        googleButton.addTarget(self, action: #selector(googleTapped), for: .touchUpInside)
    }
    
    private func configureAppleButton() {
        appleButton.anchor(left: self.centerXAnchor, paddingLeft: 15, width: 36, height: 36)
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
        footerLabel.centerX(in: self, bottom: self.safeAreaLayoutGuide.bottomAnchor, paddingBottom: 12)
    }
    
    @objc private func registerTapped() {
        delegate?.registerTapped()
    }

    @objc private func googleTapped() {
        delegate?.googleTapped()
    }
    
    @objc private func appleTapped() {
        delegate?.appleTapped()
    }
}
