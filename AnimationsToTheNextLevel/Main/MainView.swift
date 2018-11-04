//
//  MainView.swift
//  AnimationsToTheNextLevel
//
//  Created by Aline Borges on 04/11/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import UIKit

class MainView: UIViewController {

    @IBOutlet weak var theBasicsButton: UIButton!
    
    init() {
        super.init(nibName: String(describing: MainView.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onTap(_ sender: UIButton) {
        switch sender {
        case theBasicsButton:
            
        default:
            break
        }
    }
    

}



