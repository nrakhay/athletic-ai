//
//  ViewController.swift
//  athletic-ai
//
//  Created by Nurali Rakhay on 14.06.2023.
//

import UIKit

final class InitialPageVC: UIViewController {
    
    private var logoLabel = UILabel()
    private var subLogoLabel = UILabel()
    private var button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        view.addSubviews(logoLabel, subLogoLabel, button)
        
        configureLogo()
        configureSubLogo()
        configureButton()
    }
    
    @objc private func buttonTapped() {
        let vc = RegistrationVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK: - UI Configuration
    private func configureLogo() {
        logoLabel.font = UIFont.systemFont(ofSize: 50, weight: .bold)
        let completeText = InitialPageTexts.appName
        let targetText = "AI"
        let targetColor = UIColor.systemBlue
        
        logoLabel.attributedText = Helper.makeAttributedString(text: completeText, targetString: targetText, color: targetColor)
        
        logoLabel.centerX(in: view)
        logoLabel.centerY(in: view, paddingBottom: 120)
    }

    private func configureSubLogo() {
        subLogoLabel.text = InitialPageTexts.subLogo
        subLogoLabel.font = UIFont.systemFont(ofSize: 18)
        subLogoLabel.centerX(in: view, top: logoLabel.bottomAnchor, paddingTop: 0)
    }
        
    private func configureButton() {
        button.setTitle(InitialPageTexts.getStarted, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 24

        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        button.centerX(in: view, bottom: view.safeAreaLayoutGuide.bottomAnchor, paddingBottom: 12)
        button.anchor(width: 0.8 * view.width, height: 50)
    }

}

