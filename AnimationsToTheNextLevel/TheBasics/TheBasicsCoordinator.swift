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
    
    weak var parentCoordinator: Coordinator?
    
    lazy var navigationController: UINavigationController = {
        let controller = UINavigationController()
        controller.isNavigationBarHidden = true
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
        view.coordinator = self
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
        switch action {
        case TheBasicsIntroAction.finish:
            self.parentCoordinator?.handle(action)
        default:
            break
        }
    }
    
}
