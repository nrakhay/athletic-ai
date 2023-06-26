//
//  MainCoordinator.swift
//  athletic-ai
//
//  Created by Nurali Rakhay on 26.06.2023.
//

import UIKit

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController?
    
    var children: [Coordinator]? = nil
    
    func eventOccured(with type: Event) {
        switch type {
        case .getStartedTapped:
            var vc: UIViewController & Coordinating = RegistrationVC()
            vc.coordinator = self
            navigationController?.setViewControllers([vc], animated: false)
            
        case .registerTapped:
            var vc: UIViewController & Coordinating = InitialSetupVC()
            vc.coordinator = self
            navigationController?.setViewControllers([vc], animated: false)
        }
    }
    
    func start() {
        var vc: UIViewController & Coordinating = InitialPageVC()
        
        vc.coordinator = self
        
        navigationController?.setViewControllers([vc], animated: false)
    }
}

    
