//
//  SluggishView.swift
//  AnimationsToTheNextLevel
//
//  Created by Aline Borges on 06/11/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import UIKit

class SluggishView: SwipableViewController {
    
    @IBOutlet weak var ball1View: UIView!
    @IBOutlet weak var ball2View: UIView!
    @IBOutlet weak var connectingView: UIView!
    @IBOutlet weak var ball1HorizontalConstraint: NSLayoutConstraint!
    @IBOutlet weak var ball2HorizontalConstraint: NSLayoutConstraint!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var ball2TopSpace: NSLayoutConstraint!
    
    var animators: [UIViewPropertyAnimator] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        setupAnimation()
        setupSteps()
    }
    
    init() {
        super.init(nibName: String(describing: SluggishView.self), bundle: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.animators.forEach { $0.stopAnimation(true) }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension SluggishView {
    
    func setupSteps() {
        self.addStep(completion: {
            self.ball2TopSpace.setConstant(-40, animated: true)
        }) {
            self.ball2TopSpace.setConstant(24, animated: true)
        }
        
        self.addStep(completion: {
            self.connectingView.backgroundColor = .black
        }) {
            self.connectingView.backgroundColor = .clear
        }
        
        
    }
    
    func setupAnimation() {
        
        //This custom curve is responsible for the balls that starts fast
        let animator = UIViewPropertyAnimator(duration: 2,
                                              controlPoint1: CGPoint(x: 0.2, y:0.8),
                                              controlPoint2: CGPoint(x: 0.2, y:0.8)) {
                                            self.ball1HorizontalConstraint.constant = 100
                                                self.view.layoutIfNeeded()
        }
        
        //This custom curve is responsible for the balls that starts slow
        let animator2 = UIViewPropertyAnimator(duration: 2,
                                               controlPoint1: CGPoint(x: 0.8, y:0.2),
                                               controlPoint2: CGPoint(x: 0.8, y:0.2)) {
                                                self.ball2HorizontalConstraint.constant = 100
                                                self.view.layoutIfNeeded()
        }
        
        //if true, it will convert to linear curve when scrubing
        //as we want that even scrubing they obey the curve, it needs to be set to false
        animator.scrubsLinearly = false
        animator2.scrubsLinearly = false
        
        //add animators to array
        animators.append(animator)
        animators.append(animator2)
        
    }
    
    func configureViews() {
        self.ball1View.layer.cornerRadius = 20.0
        self.ball2View.layer.cornerRadius = 20.0
        self.connectingView.layer.cornerRadius = 20.0
        self.connectingView.backgroundColor = .clear
        self.scrollView.delegate = self
        self.scrollView.contentInsetAdjustmentBehavior = .never
    }
    
}

extension SluggishView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let percent = scrollView.contentOffset.x / (scrollView.contentSize.width - scrollView.frame.width)
        
        animators.forEach{ $0.fractionComplete = percent }
    }
}
