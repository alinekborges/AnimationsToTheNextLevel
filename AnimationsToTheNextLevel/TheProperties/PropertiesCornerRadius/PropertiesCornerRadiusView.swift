//
//  PropertiesCornerRadiusView.swift
//  AnimationsToTheNextLevel
//
//  Created by Aline Borges on 08/11/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import UIKit

class PropertiesCornerRadiusView: UIViewController {
    
    @IBOutlet weak var animatedView: UIView!
    var animator: UIViewPropertyAnimator!

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.landscape
    }

    init() {
        super.init(nibName: String(describing: PropertiesCornerRadiusView.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = ""
        setupAnimator()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.animator.stopAnimation(true)
    }
    
    func setupAnimator() {
        self.animator = UIViewPropertyAnimator(duration: 0.3, curve: .linear, animations: {
            self.animatedView.layer.cornerRadius = self.animatedView.frame.height / 2
        })
        
        self.animator.pausesOnCompletion = true
    }
    
    @IBAction func sliderOnChange(_ sender: UISlider) {
        self.animator.fractionComplete = CGFloat(sender.value)
    }
    
    
}
