//
//  AppCoordinator.swift
//  AnimationsToTheNextLevel
//
//  Created by Aline Borges on 04/11/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import Foundation
import UIKit

final class AppCoordinator: Coordinator {
    
    let window: UIWindow
    var mainCoordinator: MainCoordinator?
    weak var parentCoordinator: Coordinator?
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        //showIntroView()
        showMainView()
        self.window.makeKeyAndVisible()
    }
    
    func showIntroView() {
        let view = IntroView()
        view.coordinator = self
        self.window.rootViewController = view
    }
    
    func showMainView() {
        self.mainCoordinator = MainCoordinator(window: window)
        self.mainCoordinator?.start()
    }
    
}

extension AppCoordinator {
    func handle(_ action: Event) {
        switch action {
        case IntroAction.finish:
            showMainView()
        default:
            break
        }
    }
}
