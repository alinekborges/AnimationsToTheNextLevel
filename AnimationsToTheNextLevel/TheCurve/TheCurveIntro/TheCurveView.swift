//
//  TheCurveView.swift
//  AnimationsToTheNextLevel
//
//  Created by Aline Borges on 06/11/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import UIKit

class TheCurveView: UIViewController {
    
    @IBOutlet weak var pointALabel: UILabel!
    @IBOutlet weak var pointBLabel: UILabel!
    @IBOutlet weak var bezierView: BezierPathPointsView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var ballConstraint: NSLayoutConstraint!
    @IBOutlet weak var ballView: UIView!
    
    let ballPosition: CGFloat = 100
    
    var animator: UIViewPropertyAnimator?
    
    init() {
        super.init(nibName: String(describing: TheCurveView.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = ""
        setupBezierPath()
        self.scrollView.delegate = self
        self.scrollView.contentInsetAdjustmentBehavior = .never
        self.ballView.layer.cornerRadius = 20.0
        self.ballConstraint.constant = ballPosition
    }
    
    func setupBezierPath() {
        bezierView.onPointChange = { pointA, pointB in
            self.pointALabel.text = "A: \(String(format: "(%.2f,%.2f)", pointA.x, pointA.y))"
            self.pointBLabel.text = "B: \(String(format: "(%.2f,%.2f)", pointB.x, pointB.y))"
        }
        
        bezierView.onFinishPoints = setupAnimator(_:_:)
    }
    
    func setupAnimator(_ pointA: CGPoint, _ pointB: CGPoint) {
        self.animator?.stopAnimation(true)
    
        self.ballConstraint.constant = self.ballPosition
        self.view.layoutIfNeeded()
        
        self.animator = UIViewPropertyAnimator(duration: 0.3, controlPoint1: pointA, controlPoint2: pointB, animations: {
            self.ballConstraint.constant = -self.ballPosition
            self.view.layoutIfNeeded()
        })
        self.animator?.scrubsLinearly = false
        self.animator?.pausesOnCompletion = false
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.landscape
    }
}

extension TheCurveView: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let percent = scrollView.contentOffset.y / (scrollView.contentSize.height - self.view.frame.height)
        
        self.animator?.fractionComplete = percent
    }
    
}
