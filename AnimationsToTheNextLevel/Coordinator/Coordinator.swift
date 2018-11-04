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
    func start()
    func handle(_ action: Event)
}
