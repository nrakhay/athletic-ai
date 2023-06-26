//
//  InitialPageView.swift
//  athletic-ai
//
//  Created by Nurali Rakhay on 21.06.2023.
//

import UIKit

protocol InitialPageViewDelegate {
    func buttonTapped()
}

class InitialPageView: UIView {
    private var logoLabel = UILabel()
    private var subLogoLabel = UILabel()
    private var button = UIButton()
    var delegate: InitialPageViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.backgroundColor = .systemBackground
        self.addSubviews(logoLabel, subLogoLabel, button)
        
        configureLogo()
        configureSubLogo()
        configureButton()
    }
    
    private func configureLogo() {
        logoLabel.font = UIFont.systemFont(ofSize: 50, weight: .bold)
        let completeText = InitialPageTexts.appName
        let targetText = "AI"
        let targetColor = UIColor.systemBlue
        
        logoLabel.attributedText = Helper.makeAttributedString(text: completeText, targetString: targetText, color: targetColor)
        
        logoLabel.centerX(in: self)
        logoLabel.centerY(in: self, paddingBottom: 120)
    }

    private func configureSubLogo() {
        subLogoLabel.text = InitialPageTexts.subLogo
        subLogoLabel.font = UIFont.systemFont(ofSize: 18)
        subLogoLabel.centerX(in: self, top: logoLabel.bottomAnchor, paddingTop: 0)
    }
        
    private func configureButton() {
        button.setTitle(InitialPageTexts.getStarted, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12

        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        button.centerX(in: self, bottom: self.safeAreaLayoutGuide.bottomAnchor, paddingBottom: 12)
        button.anchor(width: WindowDimensions.width * 0.8, height: 50)
    }
    
    @objc private func buttonTapped() {
        delegate?.buttonTapped()
    }
    
}
