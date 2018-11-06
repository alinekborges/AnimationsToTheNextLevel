//
//  UIViewController+Coordinator.swift
//  AnimationsToTheNextLevel
//
//  Created by Aline Borges on 06/11/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import UIKit

extension UIViewController {
    
    private struct AssociatedKeys {
        static var ParentCoordinator = "ParentCoordinator"
    }
    
    weak var parentCoordinator: Coordinator? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.ParentCoordinator) as? Coordinator
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.ParentCoordinator, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
    }
}
