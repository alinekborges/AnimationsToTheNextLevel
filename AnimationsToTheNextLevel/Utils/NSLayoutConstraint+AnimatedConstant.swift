//
//  NSLayoutConstraint+AnimatedConstant.swift
//  AnimationsToTheNextLevel
//
//  Created by Aline Borges on 06/11/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import UIKit

extension NSLayoutConstraint {
    
    func setConstant(_ value: CGFloat, animated: Bool = false) {
        self.constant = value
        guard let first = self.firstItem as? UIView,
            let superview = first.superview else {
                return
        }
        
        if animated == false {
            superview.layoutIfNeeded()
            return
        }
        
        UIView.animate(withDuration: 0.3) {
            superview.layoutIfNeeded()
        }
    }
    
}
