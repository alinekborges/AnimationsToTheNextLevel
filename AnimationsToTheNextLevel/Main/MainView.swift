//
//  MainView.swift
//  AnimationsToTheNextLevel
//
//  Created by Aline Borges on 04/11/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import UIKit

enum MainAction: Event {
    case theBasics
    case theInteractive
    case theCurve
    case theProperties
    case theOnboarding
    case theSlidingComments
}

class MainView: UIViewController {

    @IBOutlet weak var theBasicsButton: UIButton!
    @IBOutlet weak var theInteractiveButton: UIButton!
    @IBOutlet weak var theCurveButton: UIButton!
    @IBOutlet weak var thePropertiesButton: UIButton!
    @IBOutlet weak var theOnboardingButton: UIButton!
    @IBOutlet weak var theSlidingComments: UIButton!
    
    weak var coordinator: Coordinator?
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.landscape
    }
    
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
            self.coordinator?.handle(MainAction.theBasics)
        case theInteractiveButton:
            self.coordinator?.handle(MainAction.theInteractive)
        case theCurveButton:
            self.coordinator?.handle(MainAction.theCurve)
        case thePropertiesButton:
            self.coordinator?.handle(MainAction.theProperties)
        case theOnboardingButton:
            self.coordinator?.handle(MainAction.theOnboarding)
        case theSlidingComments:
            self.coordinator?.handle(MainAction.theSlidingComments)
        default:
            break
        }
    }
    

}



