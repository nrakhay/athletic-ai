//
//  Coordinator.swift
//  athletic-ai
//
//  Created by Nurali Rakhay on 26.06.2023.
//

import UIKit

enum Event {
    case getStartedTapped
    case registerTapped
}

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController? { get }
     
    func start()
    func eventOccured(with type: Event)
}

protocol Coordinating {
    var coordinator: Coordinator? { get set }
}
