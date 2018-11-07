//
//  TheBasicsIntro.swift
//  AnimationsToTheNextLevel
//
//  Created by Aline Borges on 04/11/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import UIKit

class TheBasicsIntro: SwipableViewController {
    
    @IBOutlet weak var ballConstraint: NSLayoutConstraint!
    @IBOutlet weak var withDurationLabel: UILabel!
    @IBOutlet weak var insideLineStack: UIStackView!
    
    var didAnimate = false
    
    required init() {
        super.init(nibName: String(describing: TheBasicsIntro.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addStep(withDurationLabel)
        self.addStep(insideLineStack)
    }
    
    func animateBall() {
        didAnimate = true
        UIView.animate(withDuration: 0.3) {
            self.ballConstraint.constant = 100
            self.view.layoutIfNeeded()
        }
    }
    
    override func didFinishPresenting() {
        
        self.animateBall()
        
        //TODO: find curves and different properties
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.landscape
    }

}

