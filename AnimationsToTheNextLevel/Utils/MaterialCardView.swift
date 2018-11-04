//
//  MaterialCardView.swift
//  AnimationsToTheNextLevel
//
//  Created by Aline Borges on 04/11/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import UIKit

class MaterialCardView: UIView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureShadow()
    }
    
    override func prepareForInterfaceBuilder() {
        configureShadow()
    }
    
    func configureShadow() {
        self.layer.cornerRadius = 3.0
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.1
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = 4
        self.layer.shouldRasterize = false
        self.backgroundColor = .white
        self.clipsToBounds = false
    }
    
}
