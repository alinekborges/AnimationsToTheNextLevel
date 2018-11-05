//
//  TheInteractiveCoordinator.swift
//  AnimationsToTheNextLevel
//
//  Created by Aline Borges on 05/11/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import UIKit

class TheInteractiveCoordinator: FlowCoordinator {
    
    override func start() {
        showIntro()
    }
    
    func showIntro() {
        let view = TheInteractiveView()
        view.coordinator = self
        self.push(view)
        self.mainView.present(navigationController, animated: true, completion: nil)
    }
    
    func showFractionComplete() {
        let view = FractionCompleteView()
        view.coordinator = self
        self.push(view)
    }
    
    override func handle(_ action: Event) {
        switch action {
        case TheInteractiveAction.done:
            self.showFractionComplete()
        default:
            break
        }
    }
    
}
