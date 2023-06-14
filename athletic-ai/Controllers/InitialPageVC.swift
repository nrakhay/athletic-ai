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
        view.backgroundColor = .systemBackground
        super.viewDidLoad()
        view.addSubviews(logoLabel, subLogoLabel, button)
        
        configureLogo()
        configureSubLogo()
        configureButton()
    }
    
    //MARK: - UI Configuration
    private func configureLogo() {
        logoLabel.font = UIFont.systemFont(ofSize: 50, weight: .bold)
        let completeText = "AthleticAI"
        let targetText = "AI"
        let targetColor = UIColor.systemBlue
        
        logoLabel.attributedText = makeAttributedString(text: completeText, targetString: targetText, color: targetColor)
        
        setLogoConstraints()
    }
    
    private func setLogoConstraints() {
        logoLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -90)
        ])
    }
    
    
    private func makeAttributedString(text: String, targetString: String, color: UIColor) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: text)
        
        // Find the range of the target string within the complete text
        let range = (text as NSString).range(of: targetString)
        
        // Apply the desired color to the target string
        attributedString.addAttribute(.foregroundColor, value: color, range: range)
        
        return attributedString
    }

    private func configureSubLogo() {
        subLogoLabel.text = "Your AI Powered Coach"
        subLogoLabel.font = UIFont.systemFont(ofSize: 18)
        setSubLogoConstraints()
    }
    
    private func setSubLogoConstraints() {
        subLogoLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            subLogoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            subLogoLabel.topAnchor.constraint(equalTo: logoLabel.bottomAnchor)
        ])
    }
    
    private func configureButton() {
        button.setTitle("Get Started", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 24
        
        setButtonConstraints()
    }
    
    private func setButtonConstraints() {
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 0.75 * view.width),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -12),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

}

