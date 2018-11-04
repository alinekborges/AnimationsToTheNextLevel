//
//  TheBasicsIntro.swift
//  AnimationsToTheNextLevel
//
//  Created by Aline Borges on 04/11/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import UIKit

class TheBasicsIntro: UIViewController {
    
    var showViewOrdered: [UIView] = []
    
    init() {
        super.init(nibName: String(describing: TheBasicsIntro.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}
