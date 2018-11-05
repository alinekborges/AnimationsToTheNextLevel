//
//  TheInteractiveView.swift
//  AnimationsToTheNextLevel
//
//  Created by Aline Borges on 04/11/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import UIKit

enum TheInteractiveAction: Event {
    case done
}

class TheInteractiveView: SwipableViewController {
    
    weak var coordinator: Coordinator?
    
    var animator: UIViewPropertyAnimator?
    
    var didAnimate = false
    
    @IBOutlet weak var ballConstraint: NSLayoutConstraint!
    @IBOutlet weak var selfAnimator: UILabel!
    @IBOutlet weak var durationLabel: UIView!
    @IBOutlet weak var curveLabel: UIView!
    @IBOutlet weak var animationsLabel: UIView!
    @IBOutlet weak var animationDetailLabel: UIView!
    
    @IBOutlet weak var closeLabel: UILabel!
    @IBOutlet var hiddenViews: [UIView]!
    
    @IBOutlet weak var collapsedView: UILabel!
    @IBOutlet weak var startAnimationLabel: UIView!
    
    init() {
        super.init(nibName: String(describing: TheInteractiveView.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = ""
        
        self.addStep(selfAnimator)
        self.addStep(durationLabel)
        self.addStep(curveLabel)
        self.addStep([animationsLabel, closeLabel])
        self.addStep(animationDetailLabel)
        self.addStep(hiddenViews, hidden: true)
        self.addStep(collapsedView, hidden: false)
        self.addStep(startAnimationLabel)
        self.addStep([], completion: {
            self.animateBall()
        })
        
        let button = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.fastForward, target: self, action: #selector(didTapNextButton(_:)))
        self.navigationItem.rightBarButtonItem = button
    
    }
    
    @objc func didTapNextButton(_ sender: UIBarButtonItem) {
        self.coordinator?.handle(TheInteractiveAction.done)
    }
    
    func animateBall() {
        self.animator = UIViewPropertyAnimator(
            duration: 0.3,
            curve: .linear,
            animations: {
                self.ballConstraint.constant = 100
                self.view.layoutIfNeeded()
        })
        self.animator?.startAnimation()
    }
}
