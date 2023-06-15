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
    
    struct ViewModel {
        let text: String
        let iconName: String
        let width: CGFloat
        let height: CGFloat
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
    
    public func configure(with viewModel: ViewModel) {
        textField.anchor(width: viewModel.width, height: viewModel.height)
        textField.attributedPlaceholder =
        NSAttributedString(string: viewModel.text, attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray2 ])
        
        iconImageView.centerX(in: container, width: viewModel.height * 0.5, height: viewModel.height * 0.5)
        iconImageView.centerY(in: container)
        iconImageView.image = UIImage(named: viewModel.iconName)
        iconImageView.contentMode = .scaleAspectFit
        
        container.anchor(width: viewModel.height, height: viewModel.height)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
