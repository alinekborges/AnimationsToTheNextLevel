//
//  WorldOnboardingView.swift
//  AnimationsToTheNextLevel
//
//  Created by Aline Borges on 07/11/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import UIKit

class WorldOnboardingView: UIViewController {
    
    @IBOutlet weak var worldView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var londonLabel: UILabel!
    @IBOutlet weak var veniceLabel: UILabel!
    @IBOutlet weak var reykjavikLabel: UILabel!
    @IBOutlet weak var stockholmLabel: UILabel!
    
    var venicePin: UIImageView!
    var londonPin: UIImageView!
    var reykjavikPin: UIImageView!
    var stockholmPin: UIImageView!
    
    var animator: UIViewPropertyAnimator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = ""
        self.scrollView.contentInsetAdjustmentBehavior = .never
        self.scrollView.delegate = self
        createAndPositionPins()
        setupAnimator()
    }
    
    init() {
        super.init(nibName: String(describing: WorldOnboardingView.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setToolbarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.animator.stopAnimation(true)
        self.navigationController?.setToolbarHidden(false, animated: true)
    }
    
    @IBAction func closeAction(_ sender: Any) {
        self.parentCoordinator?.handle(FlowAction.finish)
    }
    
}

extension WorldOnboardingView {
    
    //Position the city pins
    func createAndPositionPins() {
        
        reykjavikPin = createPin()
        reykjavikPin.centerHorizontally(-150)
        reykjavikPin.pinBottom(210)
        
        venicePin = createPin()
        venicePin.centerHorizontally(36)
        venicePin.pinBottom(62)
        
        londonPin = createPin()
        londonPin.centerHorizontally(-80)
        londonPin.pinBottom(130)
        
        stockholmPin = createPin()
        stockholmPin.centerHorizontally(0)
        stockholmPin.pinBottom(180)

    }
    
    //creates the animator that will controll all view animations
    func setupAnimator() {
        
        //The property animator is awesome!
        //Like a normal animation, you only need to set the end value of the property you want to change
        //In this part, it is set the final frame position for each of the pins
        animator = UIViewPropertyAnimator(duration: 2, curve: .linear, animations: {
            self.venicePin.frame.origin = CGPoint(
                x: self.veniceLabel.frame.origin.x - 40,
                y: self.veniceLabel.frame.origin.y - 5)
            self.reykjavikPin.frame.origin = CGPoint(
                x: self.reykjavikLabel.frame.origin.x - 40,
                y: self.reykjavikLabel.frame.origin.y - 5)
            self.londonPin.frame.origin = CGPoint(
                x: self.londonLabel.frame.origin.x - 40,
                y: self.londonLabel.frame.origin.y - 5)
            self.stockholmPin.frame.origin = CGPoint(
                x: self.stockholmLabel.frame.origin.x - 40,
                y: self.stockholmLabel.frame.origin.y - 5)
        })
        
        //to add a few more animations, this parts takes care of scaling the pins down
        animator.addAnimations {
            self.venicePin.transform = CGAffineTransform(scaleX: 0.4, y: 0.4)
            self.reykjavikPin.transform = CGAffineTransform(scaleX: 0.4, y: 0.4)
            self.londonPin.transform = CGAffineTransform(scaleX: 0.4, y: 0.4)
            self.stockholmPin.transform = CGAffineTransform(scaleX: 0.4, y: 0.4)
        }
        
        //and this part, to change the background color
        animator.addAnimations {
            self.view.backgroundColor = .black
        }
        
        //and the world view alpha
        animator.addAnimations {
            self.worldView.alpha = 0.2
        }
        
        
    }
    
    func createPin() -> UIImageView {
        let pin = UIImageView(image: UIImage(named: "gps.png"))
        self.view.addSubview(pin)
        pin.prepareForConstraints()
        pin.constraintHeight(49)
        pin.constraintWidth(37)
        
        return pin
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    
}

extension WorldOnboardingView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let percent = (scrollView.contentOffset.x / (scrollView.contentSize.width - self.view.frame.width))
        animator.fractionComplete = percent
    }
}
