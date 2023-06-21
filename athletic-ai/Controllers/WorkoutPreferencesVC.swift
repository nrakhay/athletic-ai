//
//  WorkoutPreferencesVC.swift
//  athletic-ai
//
//  Created by Nurali Rakhay on 20.06.2023.
//

import UIKit

class WorkoutPreferencesVC: UIViewController {
    private var headerLabel = UILabel()
    private var stackView = UIStackView()
    
    private var preferencesInput = InputFieldView()
    private var workoutPlace = InputFieldView()
    private var perWeekInput = InputFieldView()
    private var intensityInput = InputFieldView()
    private var workoutDurationInput = InputFieldView()
    private var weightGoalInput = InputFieldView()
    
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
        headerLabel.text = WorkoutPreferencesTexts.header
        headerLabel.font = .systemFont(ofSize: 28, weight: .bold)
        headerLabel.centerX(in: view, top: view.safeAreaTopAnchor, paddingTop: 50)
    }
    
    private func configureStackView() {
        stackView.addArrangedSubviews(preferencesInput, workoutPlace, perWeekInput, intensityInput, workoutDurationInput, weightGoalInput)
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        
        stackView.centerX(in: view, top: headerLabel.bottomAnchor, paddingTop: 50, width: 0.8 * view.width, height: 450)
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

    
    private func configureInputFields() {
        preferencesInput.configure(with:
                .init(text: WorkoutPreferencesTexts.exercisePreferences,
                      width: view.width * 0.8,
                      height: 50,
                      pickerViewData: WorkoutPreferencesData.exercisePreferences))
        
        workoutPlace.configure(with: .init(text: WorkoutPreferencesTexts.workoutPlace, width: view.width * 0.8, height: 50, pickerViewData: WorkoutPreferencesData.workoutPlaces))
        
        perWeekInput.configure(with: .init(text: WorkoutPreferencesTexts.workoutsPerWeek, width: view.width * 0.8, height: 50))
        
        workoutDurationInput.configure(with: .init(text: WorkoutPreferencesTexts.workoutDuration, width: view.width * 0.8, height: 50, rightViewText: "/ mins"))
        
        intensityInput.configure(with: .init(text: WorkoutPreferencesTexts.intensityLevel, width: view.width * 0.8, height: 50, pickerViewData: WorkoutPreferencesData.intensityLevels))
        
        weightGoalInput.configure(with: .init(text: WorkoutPreferencesTexts.weightGoal, width: view.width * 0.8, height: 50, pickerViewData: WorkoutPreferencesData.weights, rightViewText: "/ kg"))
    }

}
