//
//  MainCoordinator.swift
//  AnimationsToTheNextLevel
//
//  Created by Aline Borges on 04/11/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import UIKit

final class MainCoordinator: Coordinator {
    
    let window: UIWindow
    
    weak var parentCoordinator: Coordinator?
    var currentCoordinator: Coordinator?
    var mainView: MainView!
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        showMainView()
    }
    
    func showMainView() {
        let mainView = MainView()
        self.mainView = mainView
        mainView.coordinator = self
        self.window.rootViewController = mainView
    }
    
    func showTheBasics() {
        self.currentCoordinator = TheBasicsCoordinator(mainView: self.mainView)
        self.currentCoordinator?.parentCoordinator = self
        self.currentCoordinator?.start()
    }
    
    func showTheInteractive() {
        self.currentCoordinator = TheInteractiveCoordinator(mainView: self.mainView)
        self.currentCoordinator?.parentCoordinator = self
        self.currentCoordinator?.start()
    }
    
    func dismissCurrent() {
        self.mainView.dismiss(animated: true, completion: nil)
        self.currentCoordinator = nil
    }
    
}

extension MainCoordinator {
    
    func handle(_ action: Event) {
        switch action {
        case MainAction.theBasics:
            showTheBasics()
        case MainAction.theInteractive:
            showTheInteractive()
        case TheBasicsIntroAction.finish:
            dismissCurrent()
        default:
            break
        }
    }
    
}
