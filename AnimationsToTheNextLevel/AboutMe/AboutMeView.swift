//
//  AboutMeView.swift
//  AnimationsToTheNextLevel
//
//  Created by Aline Borges on 08/11/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import UIKit

class AboutMeView: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = ""
    }
    
    init() {
        super.init(nibName: String(describing: AboutMeView.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
