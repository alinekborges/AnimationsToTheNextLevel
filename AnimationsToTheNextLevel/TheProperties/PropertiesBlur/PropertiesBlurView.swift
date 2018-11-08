//
//  PropertiesBlurView.swift
//  AnimationsToTheNextLevel
//
//  Created by Aline Borges on 08/11/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import UIKit

class PropertiesBlurView: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var blurView: UIVisualEffectView!
    
    var animator: UIViewPropertyAnimator?
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.landscape
    }

    init() {
        super.init(nibName: String(describing: PropertiesBlurView.self), bundle: nil)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = ""
        self.scrollView.contentInsetAdjustmentBehavior = .never
        self.scrollView.delegate = self
        self.setupAnimator()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.barTintColor = .black
        self.navigationController?.navigationBar.tintColor = .white
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.tintColor = .black
    }
    
    func setupAnimator() {
        
        self.blurView.effect = nil
        
        self.animator = UIViewPropertyAnimator(duration: 0.3, curve: .linear, animations: {
            self.blurView.effect = UIBlurEffect(style: .dark)
        })
        
    }
    
}

extension PropertiesBlurView: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let percent = scrollView.contentOffset.x / (scrollView.contentSize.width - scrollView.frame.width)
        
        animator?.fractionComplete = percent
    }
    
}
