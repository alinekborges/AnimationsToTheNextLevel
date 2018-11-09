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

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var theBasicsButton: UIButton!
    @IBOutlet weak var aboutMeView: MaterialCardView!
    @IBOutlet weak var theInteractiveButton: UIButton!
    @IBOutlet weak var theCurveButton: UIButton!
    @IBOutlet weak var thePropertiesButton: UIButton!
    @IBOutlet weak var theOnboardingButton: UIButton!
    @IBOutlet weak var theSlidingComments: UIButton!
    
    @IBOutlet weak var theBasicsBall: UIView!
    @IBOutlet weak var theInteractiveBall: UIView!
    
    weak var coordinator: Coordinator?
    
    var theInteractorAnimator: UIViewPropertyAnimator!
    
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
        setupAboutMe()
        setupTheBasicsAnimation()
        setupTheInteractiveAnimator()
        self.scrollView.delegate = self
    }
    
    func setupAboutMe() {
        let aboutMe = AboutMeView()
        self.aboutMeView.addSubview(aboutMe.view)
        aboutMe.view.prepareForConstraints()
        aboutMe.view.pinEdgesToSuperview()
        self.addChild(aboutMe)
        
    }
    
    func setupTheBasicsAnimation() {
        
        self.theBasicsBall.layer.cornerRadius = 20
        
        self.theBasicsBall.transform = CGAffineTransform(translationX: 0, y: -100)
        
        UIView.animate(withDuration: 3,
                       delay: 0.5,
                       usingSpringWithDamping: 0.12,
                       initialSpringVelocity: 2,
                       options: UIView.AnimationOptions.curveLinear,
                       animations: {
            self.theBasicsBall.transform = CGAffineTransform.identity
        }) { _ in
            self.setupTheBasicsAnimation()
        }
        
    }
    
    func setupTheInteractiveAnimator() {
        self.theInteractiveBall.layer.cornerRadius = 20
        
        self.theInteractorAnimator = UIViewPropertyAnimator(duration: 0.4, dampingRatio: 0.5, animations: {
            let transform = CGAffineTransform(translationX: 0, y: -40)
            let transform2 = transform.concatenating(CGAffineTransform(scaleX: 3, y: 3))
            self.theInteractiveBall.transform = transform2
            self.theInteractiveBall.backgroundColor = #colorLiteral(red: 0.3137254902, green: 0.8901960784, blue: 0.7607843137, alpha: 1)
        })
        self.theInteractorAnimator.pausesOnCompletion = true
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

extension MainView: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let secondPagePercent = (scrollView.contentOffset.x) / (scrollView.contentSize.width - scrollView.frame.width) * 6.25

        self.theInteractorAnimator.fractionComplete = secondPagePercent
    }
    
}
