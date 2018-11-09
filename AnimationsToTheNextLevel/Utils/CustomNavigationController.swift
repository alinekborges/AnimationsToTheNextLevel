//
//  CustomNavigationController.swift
//  AnimationsToTheNextLevel
//
//  Created by Aline Borges on 05/11/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import UIKit

class CustomNavigationController: UINavigationController {
    
    var hideToolbar: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.tintColor = .black
        self.setNavigationBarHidden(self.hideToolbar, animated: false)
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if hideToolbar {
            return UIInterfaceOrientationMask.portrait
        } else {
            return UIInterfaceOrientationMask.landscape
        }
    }
}
