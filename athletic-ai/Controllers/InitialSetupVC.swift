//
//  InitialSetupVC.swift
//  athletic-ai
//
//  Created by Nurali Rakhay on 18.06.2023.
//

import UIKit

class InitialSetupVC: UIViewController, Coordinating {
    var coordinator: Coordinator?
    private var headerLabel = UILabel()
    private var stackView = UIStackView()
    
    private var genderInput = InputFieldView()
    private var dateOfBirthInput = InputFieldView()
    private var weightInput = InputFieldView()
    private var heightInput = InputFieldView()
    private var fitnessLevelInput = InputFieldView()

    private var nextButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.hidesBackButton = true
        navigationController?.setNavigationBarHidden(true, animated: false)
        self.hideKeyboardWhenTappedAround()
        
        view.addSubviews(headerLabel, stackView, nextButton)
        
        configureHeaderLabel()
        configureStackView()
        configureInputFields()
        configureNextButton()
    }

    @objc private func nextTapped() {
        let vc = WorkoutPreferencesVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    private func configureHeaderLabel() {
        headerLabel.text = InitialSetupTexts.header
        headerLabel.font = .systemFont(ofSize: 32, weight: .bold)
        headerLabel.centerX(in: view, top: view.safeAreaTopAnchor, paddingTop: 50)
    }
    
    private func configureStackView() {
        stackView.addArrangedSubviews(genderInput, dateOfBirthInput, weightInput, heightInput, fitnessLevelInput)
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        
        stackView.centerX(in: view, top: headerLabel.bottomAnchor, paddingTop: 50, width: 0.8 * view.width, height: 375)
    }
    
    private func configureInputFields() {
        genderInput.configure(with: .init(text: InitialSetupTexts.gender, width: view.width * 0.8, height: 50, pickerViewData: InitialSetupData.genders))
        
        dateOfBirthInput.configure(with: .init(text: InitialSetupTexts.dateOfBirth, width: view.width * 0.8, height: 50, hasDatePicker: true))
        
        weightInput.configure(with: .init(text: InitialSetupTexts.weight, width: view.width * 0.8, height: 50, pickerViewData: InitialSetupData.weights, rightViewText: "/ kg"))
        
        heightInput.configure(with: .init(text: InitialSetupTexts.height, width: view.width * 0.8, height: 50, pickerViewData: InitialSetupData.heights, rightViewText: "/ cm"))
        
        fitnessLevelInput.configure(with: .init(text: InitialSetupTexts.fitnessLevel, width: view.width * 0.8, height: 50, pickerViewData: InitialSetupData.fitnessLevels))
    }

    private func configureNextButton() {
        nextButton.setTitle(InitialSetupTexts.next, for: .normal)
        nextButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.backgroundColor = .systemBlue
        nextButton.layer.cornerRadius = 24
        nextButton.addTarget(self, action: #selector(nextTapped), for: .touchUpInside)
        
        nextButton.centerX(in: view, bottom: view.safeAreaBottomAnchor, paddingBottom: 20)
        nextButton.anchor(width: 0.8 * view.width, height: 50)
    }

}
