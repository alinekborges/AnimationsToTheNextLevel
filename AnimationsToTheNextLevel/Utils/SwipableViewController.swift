//
//  SwipableViewController.swift
//  AnimationsToTheNextLevel
//
//  Created by Aline Borges on 04/11/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import UIKit

class SwipableViewController: UIViewController {
    
    var animatedViews: [UIView] = []
    var currentPosition = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.didSwipeLeft(_:)))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.didSwipeRight(_:)))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.animatedViews.forEach { $0.isHidden = true }
    }
    
    @objc func didSwipeLeft(_ gesture: UISwipeGestureRecognizer) {
        showNext()
    }
    
    @objc func didSwipeRight(_ gesture: UISwipeGestureRecognizer) {
        hidePrevious()
    }
    
    func showNext() {
        if currentPosition >= self.animatedViews.count - 1 {
            self.didFinishPresenting()
            return
        }
        
        currentPosition += 1
        
        UIView.animate(withDuration: 0.3) {
            self.animatedViews[self.currentPosition]
                .isHidden = false
        }
    }
    
    func hidePrevious() {
        if currentPosition < 0 { return }
        
        UIView.animate(withDuration: 0.3, animations: {
            self.animatedViews[self.currentPosition]
                .isHidden = true
        }) { _ in
            self.currentPosition -= 1
        }
        
    }
    
    func didFinishPresenting() {
        print("finished presenting")
    }
}
