//
//  TheBasicsCoordinator.swift
//  AnimationsToTheNextLevel
//
//  Created by Aline Borges on 04/11/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import UIKit

class TheBasicsCoordinator: Coordinator {
    
    let mainView: MainView
    lazy var navigationController: UINavigationController = {
        let controller = UINavigationController()
        return controller
    }()
    
    init(mainView: MainView) {
        self.mainView = mainView
    }
    
    func start() {
        showIntro()
    }
    
    func showIntro() {
        let view = TheBasicsIntro()
        self.push(view)
        self.mainView.present(navigationController, animated: true, completion: nil)
    }
    
    func push(_ controller: UIViewController) {
        if self.navigationController.viewControllers.isEmpty {
            self.navigationController.viewControllers = [controller]
        } else {
            self.navigationController.pushViewController(controller, animated: true)
        }
    }
    
}

extension TheBasicsCoordinator {
    
    func handle(_ action: Event) {
        
    }
    
}
