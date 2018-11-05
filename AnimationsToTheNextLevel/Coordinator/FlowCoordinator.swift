//
//  FlowCoordinator.swift
//  AnimationsToTheNextLevel
//
//  Created by Aline Borges on 05/11/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import UIKit

class FlowCoordinator: Coordinator {
    
    let mainView: MainView
    
    weak var parentCoordinator: Coordinator?
    
    lazy var navigationController: CustomNavigationController = {
        let controller = CustomNavigationController()
        return controller
    }()
    
    init(mainView: MainView) {
        self.mainView = mainView
    }
    
    func start() {
        fatalError("Override in subclass")
    }
    
    func handle(_ action: Event) {
        fatalError("Override in subclass")
    }
    
    func push(_ controller: UIViewController) {
        if self.navigationController.viewControllers.isEmpty {
            self.navigationController.viewControllers = [controller]
        } else {
            self.navigationController.pushViewController(controller, animated: true)
        }
    }
}
