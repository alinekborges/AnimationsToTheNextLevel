//
//  PropertiesCornerRadiusView.swift
//  AnimationsToTheNextLevel
//
//  Created by Aline Borges on 08/11/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import UIKit

class PropertiesCornerRadiusView: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    var animator: UIViewPropertyAnimator?
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.landscape
    }

    init() {
        super.init(nibName: String(describing: PropertiesCornerRadiusView.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = ""
        self.scrollView.contentInsetAdjustmentBehavior = .never
        self.scrollView.delegate = self
    }
    
}

extension PropertiesCornerRadiusView: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let percent = scrollView.contentOffset.x / (scrollView.contentSize.width - scrollView.frame.width)
        
        animator?.fractionComplete = percent
    }
    
}
