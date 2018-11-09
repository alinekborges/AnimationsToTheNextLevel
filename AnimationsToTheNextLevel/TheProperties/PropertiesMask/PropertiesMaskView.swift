//
//  PropertiesMaskView.swift
//  AnimationsToTheNextLevel
//
//  Created by Aline Borges on 08/11/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import UIKit

class PropertiesMaskView: UIViewController {
    
    lazy var cameraView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.prepareForConstraints()
        return view
    }()
    
    lazy var maskView: UIView = {
        let view = UIView()
        return view
    }()
    
    init() {
        super.init(nibName: String(describing: PropertiesMaskView.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = ""
    }
    
    func addCamera() {
        self.view.addSubview(cameraView)
        self.view.pinEdgesToSuperview()
        self.view.layoutIfNeeded()
        
        self.maskView.frame = CGRect(x: 50, y: 50, width: 200, height: 200)
        maskView.layer.cornerRadius = 100
        //self.cameraView.mask = self.maskView
    }
    
    @IBAction func openCamera(_ sender: Any) {
        self.addCamera()
    }
}
