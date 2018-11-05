//
//  Coordinator.swift
//  AnimationsToTheNextLevel
//
//  Created by Aline Borges on 04/11/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import Foundation

protocol Event { }

protocol Coordinator: class {
    var parentCoordinator: Coordinator? { get set }
    func start()
    func handle(_ action: Event)
}

extension Coordinator where Self: Coordinator {
    var parentCoordinator: Coordinator? {
        return nil
    }
}
