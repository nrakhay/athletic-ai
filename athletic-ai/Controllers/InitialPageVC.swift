//
//  InitialPageVC.swift
//  athletic-ai
//
//  Created by Nurali Rakhay on 14.06.2023.
//

import UIKit

final class InitialPageVC: UIViewController, Coordinating {
    var coordinator: Coordinator?
    
    lazy var initialPageView = InitialPageView()
    
    override func loadView() { 
        self.view = initialPageView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialPageView.delegate = self
    }
}

extension InitialPageVC: InitialPageViewDelegate {
    func buttonTapped() {
        coordinator?.eventOccured(with: .getStartedTapped)
    }
}
