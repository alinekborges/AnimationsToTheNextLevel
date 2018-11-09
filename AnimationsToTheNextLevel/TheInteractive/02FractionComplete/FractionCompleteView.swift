//
//  FractionCompleteView.swift
//  AnimationsToTheNextLevel
//
//  Created by Aline Borges on 05/11/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import UIKit

class FractionCompleteView: SwipableViewController {

    @IBOutlet weak var fractionCompleteLine: UIStackView!
    @IBOutlet weak var ballView: UIView!
    @IBOutlet weak var fractionCompleteLabel: UILabel!
    @IBOutlet weak var ballConstraint: NSLayoutConstraint!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var animator: UIViewPropertyAnimator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = ""
        self.ballView.layer.cornerRadius = 20.0
        self.scrollView.delegate = self
        self.scrollView.contentInsetAdjustmentBehavior = .never
        setupAnimator()
        self.setupSteps()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.animator?.stopAnimation(true)
    }
    
    init() {
        super.init(nibName: String(describing: FractionCompleteView.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension FractionCompleteView {
    
    func setupSteps() {
        self.addStep(self.fractionCompleteLine)
    }
    
    func setupAnimator() {
        
        self.ballConstraint.constant = -100
        self.view.layoutIfNeeded()
        
        self.animator = UIViewPropertyAnimator(duration: 0.3, curve: .linear, animations: {
            self.ballConstraint.constant = 100
            self.view.layoutIfNeeded()
        })
        
        self.animator?.pausesOnCompletion = true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.landscape
    }
    
}

extension FractionCompleteView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let percent = scrollView.contentOffset.x / (scrollView.contentSize.width - scrollView.frame.width)
        
        animator?.fractionComplete = percent
        self.fractionCompleteLabel.text = String(format: "%.2f", percent)
    }
}
