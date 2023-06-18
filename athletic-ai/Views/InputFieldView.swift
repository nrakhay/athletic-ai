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
    private var iconImageView = UIImageView()
    private var pickerView: UIPickerView?
    private var pickerData: [Any]?
    
    struct ViewModel {
        let text: String
        let iconName: String
        let width: CGFloat
        let height: CGFloat
        let pickerViewData: [Any]?
        
        init(text: String, iconName: String, width: CGFloat, height: CGFloat, pickerViewData: [Any]? = nil) {
            self.text = text
            self.iconName = iconName
            self.width = width
            self.height = height
            self.pickerViewData = pickerViewData
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(textField)
        container.addSubview(iconImageView)
        
        configureTextField()
    }

    private func configureTextField() {
        textField.leftView = container
        textField.leftViewMode = .always
        textField.layer.cornerRadius = 12
        textField.backgroundColor = .systemGray6
    }
    
//    public func customBecomeFirstResponder() {
//        textField.becomeFirstResponder()
//    }
//
//    public func customResignFirstResponder() {
//        textField.resignFirstResponder()
//    }
    
    public func getText() -> String? {
        return textField.text
    }
    
    public func configure(with viewModel: ViewModel) {
        textField.anchor(width: viewModel.width, height: viewModel.height)
        textField.attributedPlaceholder =
        NSAttributedString(string: viewModel.text, attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray2 ])
        
//        textField.delegate = vc as? UITextFieldDelegate
        
        iconImageView.centerX(in: container, width: viewModel.height * 0.5, height: viewModel.height * 0.5)
        iconImageView.centerY(in: container)
        iconImageView.image = UIImage(named: viewModel.iconName)
        iconImageView.contentMode = .scaleAspectFit
        
        container.anchor(width: viewModel.height, height: viewModel.height)
        
        if let data = viewModel.pickerViewData {
            pickerData = data
            configurePickerView(with: data)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configurePickerView(with data: [Any]) {
        pickerView = UIPickerView()
        textField.inputView = pickerView
        pickerView?.delegate = self
        pickerView?.dataSource = self
    }
    
}

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
            textField.resignFirstResponder()
        }
    }
}
