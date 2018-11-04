//
//  CircleView.swift
//  AnimationsToTheNextLevel
//
//  Created by Aline Borges on 04/11/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import UIKit

@IBDesignable
class CircleView: UIView {
    
    override func awakeFromNib() {
        self.clipsToBounds = true
        self.layer.cornerRadius =
            self.frame.height / 2
    }
    
    override func prepareForInterfaceBuilder() {
        self.clipsToBounds = true
        self.layer.cornerRadius =
            self.frame.height / 2
    }
    
}
