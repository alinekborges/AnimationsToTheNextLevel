//
//  RuleOfThreeView.swift
//  AnimationsToTheNextLevel
//
//  Created by Aline Borges on 07/11/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import UIKit

class RuleOfThreeView: SwipableViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var currentPositionValueLabel: UILabel!
    @IBOutlet weak var scrollWidthView: UIView!
    @IBOutlet weak var scrollFullWidthView: UIView!
    @IBOutlet weak var currentPositionLabel: UILabel!
    @IBOutlet weak var ruleOfThreeView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = ""
        self.setupSteps()
        self.setupViews()
    }
    
    init() {
        super.init(nibName: String(describing: RuleOfThreeView.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
}

extension RuleOfThreeView {
    
    func setupSteps() {
        self.addStep(self.scrollWidthView)
        self.addStep(self.scrollFullWidthView)
        self.addStep([self.currentPositionLabel, self.currentPositionValueLabel])
        self.addStep(self.ruleOfThreeView)
    }
    
    func setupViews() {
        self.scrollView.layer.borderColor = UIColor.black.withAlphaComponent(0.5).cgColor
        self.scrollView.layer.borderWidth = 1
        self.scrollView.delegate = self
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.landscape
    }
    
}

extension RuleOfThreeView: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //let percent = scrollView.contentOffset.x / (scrollView.contentSize.width - scrollView.frame.width)
        
        self.currentPositionValueLabel.text = "\(Int(scrollView.contentOffset.x))"
    }
    
}
