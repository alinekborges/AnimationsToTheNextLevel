//
//  SwipableViewController.swift
//  AnimationsToTheNextLevel
//
//  Created by Aline Borges on 04/11/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import UIKit

class SwipableViewController: UIViewController {
    
    typealias AnimatedStep = (views: [UIView], hidden: Bool, completion: (()->Void)?, onBack: (()->Void)?)
    var animatedSteps: [AnimatedStep] = []
    var currentPosition = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.didSwipeLeft(_:)))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.didSwipeRight(_:)))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.didTap(_:)))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    func addStep(completion: @escaping (()->Void), onBack: @escaping (()->Void)) {
        self.animatedSteps.append(AnimatedStep(views: [], hidden: true, completion: completion, onBack: onBack))
    }
    
    func addStep(_ views: [UIView] = [], hidden: Bool = false, completion: (()->Void)? = nil, onBack: (()->Void)? = nil) {
        self.animatedSteps.append(AnimatedStep(views: views, hidden: hidden, completion: completion, onBack: onBack))
    }
    
    func addStep(_ view: UIView, hidden: Bool = false, completion: (()->Void)? = nil, onBack: (()->Void)? = nil) {
        self.animatedSteps.append(AnimatedStep(views: [view], hidden: hidden, completion: completion, onBack: onBack))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.animatedSteps.forEach {
            $0.views.forEach { $0.isHidden = true }
        }
    }
    
    @objc func didTap(_ gesture: UITapGestureRecognizer) {
        showNext()
    }
    
    @objc func didSwipeLeft(_ gesture: UISwipeGestureRecognizer) {
        showNext()
    }
    
    @objc func didSwipeRight(_ gesture: UISwipeGestureRecognizer) {
        hidePrevious()
    }
    
    func showNext() {
        if currentPosition >= self.animatedSteps.count - 1 {
            self.didFinishPresenting()
            return
        }
        
        currentPosition += 1
        
        let currentStep = self.animatedSteps[self.currentPosition]
        
        UIView.animate(withDuration: 0.3, animations: {
            currentStep.views.forEach {
                $0.isHidden = currentStep.hidden
            }
        }) { _ in
            currentStep.completion?()
        }

    }
    
    func hidePrevious() {
        if currentPosition < 0 { return }
        
        let currentStep = self.animatedSteps[self.currentPosition]
        
        UIView.animate(withDuration: 0.3, animations: {
            currentStep.views.forEach {
                $0.isHidden = !currentStep.hidden
            }
        }) { _ in
            currentStep.onBack?()
        }
        
        self.currentPosition -= 1
        
    }
    
    func didFinishPresenting() {
       
    }
}
