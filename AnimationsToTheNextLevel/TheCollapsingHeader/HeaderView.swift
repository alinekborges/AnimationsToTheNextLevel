//
//  HeaderView.swift
//  AnimationsToTheNextLevel
//
//  Created by Aline Borges on 09/11/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import UIKit

class HeaderView: UIView {
    
    let maxHeight: CGFloat = 160
    let minHeight: CGFloat = 72
    
    var heightConstraint: NSLayoutConstraint!

    var fractionComplete: CGFloat = 0.0 {
        didSet {
            self.animator?.fractionComplete = fractionComplete
        }
    }
    
    private var animator: UIViewPropertyAnimator?
    private var expandAnimator: UIViewPropertyAnimator?
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 30, height: self.maxHeight)
    }
    
    private let logo: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "logo"))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let searchTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor.white.withAlphaComponent(0.25)
        textField.layer.cornerRadius = 6.0
        textField.textColor = .white
        textField.tintColor = .white
        textField.font = UIFont.boldSystemFont(ofSize: 18)
        textField.clearsOnBeginEditing = true
        textField.accessibilityIdentifier = "search_input"
        return textField
    }()
    
    let searchButton: UIButton = {
        let button = UIButton()
        button.setTitle("", for: .normal)
        button.setImage(#imageLiteral(resourceName: "search"), for: .normal)
        button.accessibilityIdentifier = "search_button"
        return button
    }()
    
    let blurView: UIVisualEffectView = {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        return view
    }()
    
    let bottomLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white.withAlphaComponent(0.6)
        return view
    }()
    
    let infoButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.infoLight)
        button.tintColor = .white
        return button
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupViews()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setupViews()
    }
    
    private func setupViews() {
        self.backgroundColor = .clear
        self.setupConstraints()
        
        self.searchTextField.setPadding(14)
        
        self.setupAnimator()
    }
    
    func collapse() {
        self.animator?.startAnimation()
    }
    
    func expand() {
        //figure out a way to do this animated
        self.fractionComplete = 0.0
    }
    
    func stopAnimations() {
        self.animator?.stopAnimation(true)
    }
    
    private func setupAnimator() {
        
        var topPadding: CGFloat = 0.0
        
        if #available(iOS 11.0, *) {
            if let bla = UIApplication.shared.delegate!.window {
                topPadding = bla?.safeAreaInsets.top ?? 0.0
            }
            
        }
        
        self.animator = UIViewPropertyAnimator(duration: 0.25, curve: .linear, animations: {
            self.heightConstraint.constant = self.minHeight + topPadding
            self.logo.alpha = 0
            self.infoButton.alpha = 0
            self.superview?.layoutIfNeeded()
            self.layoutIfNeeded()
        })
        
        self.animator?.pausesOnCompletion = true
        
    }
    
    private func setupConstraints() {
        
        self.addSubview(self.blurView)
        self.addSubview(self.searchTextField)
        self.addSubview(self.searchButton)
        self.addSubview(self.bottomLine)
        self.addSubview(self.infoButton)
        self.addSubview(self.logo)
        
        self.blurView.prepareForConstraints()
        self.searchTextField.prepareForConstraints()
        self.searchButton.prepareForConstraints()
        self.bottomLine.prepareForConstraints()
        self.infoButton.prepareForConstraints()
        self.logo.prepareForConstraints()
        
        self.blurView.pinEdgesToSuperview()
        
        self.logo.pinLeft(30.0)
        self.logo.pinBottom(50.0)
        self.logo.pinRight(140.0)
        
        self.searchTextField.pinLeft(30.0)
        self.searchTextField.pinRight(30.0)
        self.searchTextField.pinBottom(12.0)
        self.searchTextField.constraintHeight(36.0)
        
        self.searchButton.pinBottom(18.0)
        self.searchButton.pinRight(36.0)
        self.searchButton.constraintHeight(20.0)
        self.searchButton.constraintWidth(20.0)
        
        self.bottomLine.constraintHeight(1)
        self.bottomLine.pinRight()
        self.bottomLine.pinLeft()
        self.bottomLine.pinBottom()
        
        self.infoButton.pinRight(24)
        self.infoButton.centerYAnchor.constraint(equalTo: self.logo.centerYAnchor).isActive = true
        
        var topPadding: CGFloat = 0.0
        
        if #available(iOS 11.0, *) {
            if let bla = UIApplication.shared.delegate!.window {
                topPadding = bla?.safeAreaInsets.top ?? 0.0
            }
            
        }
        
        self.heightConstraint = self.constraintHeight(self.maxHeight + topPadding)
        
        self.layoutIfNeeded()
        
    }
    
}

extension UITextField {
    func setPadding(_ width: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}
