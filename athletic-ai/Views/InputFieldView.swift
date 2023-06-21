//
//  InputFieldView.swift
//  athletic-ai
//
//  Created by Nurali Rakhay on 15.06.2023.
//

import UIKit

class InputFieldView: UIView {
    private var textField = UITextField()
    private var container = UIView()
//    private var iconImageView = UIImageView()
    private var pickerView: UIPickerView?
    private var pickerData: [Any]?
    private var datePicker: UIDatePicker?
    
    struct ViewModel {
        let text: String
        let width: CGFloat
        let height: CGFloat
        let pickerViewData: [Any]?
        let hasDatePicker: Bool
        let rightViewText: String?
        
        init(text: String, width: CGFloat, height: CGFloat, pickerViewData: [Any]? = nil, rightViewText: String? = nil) {
            self.text = text
            self.width = width
            self.height = height
            self.pickerViewData = pickerViewData
            self.hasDatePicker = false
            self.rightViewText = rightViewText
        }
        
        init(text: String, width: CGFloat, height: CGFloat, hasDatePicker: Bool) {
            self.text = text
            self.width = width
            self.height = height
            self.hasDatePicker = hasDatePicker
            self.pickerViewData = nil
            self.rightViewText = nil
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(textField)
        configureTextField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Public methods
    
    public func getText() -> String? {
        return textField.text
    }
    
    public func configure(with viewModel: ViewModel) {
        textField.anchor(width: viewModel.width, height: viewModel.height)
        textField.attributedPlaceholder =
        NSAttributedString(string: viewModel.text, attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray2 ])
        
//        iconImageView.centerX(in: container, width: viewModel.height * 0.5, height: viewModel.height * 0.5)
//        iconImageView.centerY(in: container)
//        iconImageView.image = UIImage(named: viewModel.iconName)
//        iconImageView.contentMode = .scaleAspectFit
        
        container.anchor(width: viewModel.height, height: viewModel.height)
        
        if let data = viewModel.pickerViewData {
            pickerData = data
            configurePickerView(with: data)
        }
        
        if viewModel.hasDatePicker {
            configureDatePicker()
        }
        
        if let text = viewModel.rightViewText {
            configureRightView(with: text)
        }
        
        
        if viewModel.text == WorkoutPreferencesTexts.workoutsPerWeek ||
            viewModel.text == WorkoutPreferencesTexts.workoutDuration {
            textField.keyboardType = .numberPad
        }
    }
    
    //MARK: - Private Methods
    
    private func configureTextField() {
//        container.addSubview(iconImageView)
//        textField.leftView = container
        textField.setPaddingFor(left: 24)
//        textField.leftViewMode = .always
        textField.layer.cornerRadius = 12
        textField.backgroundColor = .systemGray6
    }
    
    private func configurePickerView(with data: [Any]) {
        pickerView = UIPickerView()
        textField.inputView = pickerView
        textField.inputAccessoryView = createToolbar()
        pickerView?.delegate = self
        pickerView?.dataSource = self
    }
    
    private func configureDatePicker() {
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.preferredDatePickerStyle = .wheels
        datePicker?.maximumDate = Date()
        datePicker?.addTarget(self, action: #selector(datePickerValueChanged), for: .valueChanged)
        
        textField.inputAccessoryView = createToolbar()
        textField.inputView = datePicker
    }
    
    @objc private func datePickerValueChanged(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let selectedDate = dateFormatter.string(from: sender.date)
        
        textField.text = selectedDate
    }
    
    private func createToolbar() -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        
        toolbar.setItems([doneButton], animated: true)
        
        return toolbar
    }
    
    @objc private func donePressed() {
        textField.endEditing(true)
    }
    
    private func configureRightView(with text: String) {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 50))

        label.text = text
        label.textColor = .systemGray2
        view.addSubview(label)
        
        textField.rightView = view
        textField.rightViewMode = .always
    }
}


//MARK: - UIPickerView

extension InputFieldView: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if let data = pickerData {
            return data.count
        }
        
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if let data = pickerData {
            return String(describing: data[row])
        }
        
        return "null"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if let data = pickerData {
            textField.text = String(describing: data[row])
//            textField.resignFirstResponder()
        }
    }
}
