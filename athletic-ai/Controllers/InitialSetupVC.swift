//
//  InitialSetupVC.swift
//  athletic-ai
//
//  Created by Nurali Rakhay on 18.06.2023.
//

import UIKit

class InitialSetupVC: UIViewController {

    private var headerLabel = UILabel()
    private var stackView = UIStackView()
    
    private var genderInput = InputFieldView()
    private var dateOfBirthInput = InputFieldView()
    private var weightInput = InputFieldView()
    private var heightInput = InputFieldView()
    private var fitnessLevelInput = InputFieldView()
    
    private let genders = ["Male", "Female"]
    private let fitnessLevels = ["Beginner", "Intermediate", "Advanced"]
    private let weights: [Int] = {
        var array = [Int]()
        for weight in 35...200 {
            array.append(weight)
        }
        return array
    }()
    
    private let heights: [Int] = {
        var array = [Int]()
        for weight in 140...220 {
            array.append(weight)
        }
        return array
    }()
    
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
        genderInput.configure(with: .init(text: InitialSetupTexts.gender, iconName: IconNames.genderIcon, width: view.width * 0.8, height: 50, pickerViewData: genders))
        
        dateOfBirthInput.configure(with: .init(text: InitialSetupTexts.dateOfBirth, iconName: IconNames.calendarIcon, width: view.width * 0.8, height: 50))
        
        weightInput.configure(with: .init(text: InitialSetupTexts.weight, iconName: IconNames.weightIcon, width: view.width * 0.8, height: 50, pickerViewData: weights))
        
        heightInput.configure(with: .init(text: InitialSetupTexts.height, iconName: IconNames.heightIcon, width: view.width * 0.8, height: 50, pickerViewData: heights))
        
        fitnessLevelInput.configure(with: .init(text: InitialSetupTexts.fitnessLevel, iconName: IconNames.levelIcon, width: view.width * 0.8, height: 50, pickerViewData: fitnessLevels))
    }

    private func configureNextButton() {
        nextButton.setTitle(InitialSetupTexts.next, for: .normal)
        nextButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        nextButton.backgroundColor = .systemBlue
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.layer.cornerRadius = 24
        nextButton.addTarget(self, action: #selector(nextTapped), for: .touchUpInside)
        
        nextButton.centerX(in: view, bottom: view.safeAreaBottomAnchor, paddingBottom: 20)
        nextButton.anchor(width: 0.8 * view.width, height: 50)
    }

}
