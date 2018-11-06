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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = ""
        setupBezierPath()
    }
    
    func setupBezierPath() {
        bezierView.onPointChange = { pointA, pointB in
            self.pointALabel.text = "A: \(String(format: "(%.2f,%.2f)", pointA.x, pointA.y))"
            self.pointBLabel.text = "B: \(String(format: "(%.2f,%.2f)", pointB.x, pointB.y))"
        }
    }
    
    init() {
        super.init(nibName: String(describing: TheCurveView.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
