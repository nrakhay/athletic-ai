//
//  BlueButton.swift
//  athletic-ai
//
//  Created by Nurali Rakhay on 18.06.2023.
//

import UIKit

class BlueButton: UIButton {

    private var button = UIButton()
    
    init() {
        super.init(frame: .zero)
        button.setTitle(RegistrationTexts.register, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 24
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
