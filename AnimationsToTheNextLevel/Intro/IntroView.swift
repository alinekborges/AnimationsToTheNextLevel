//
//  IntroView.swift
//  AnimationsToTheNextLevel
//
//  Created by Aline Borges on 02/11/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import UIKit

class IntroView: UIViewController {

    @IBOutlet weak var titleContainer: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var nameLabel: UILabel!
    
    let font = UIFont.systemFont(ofSize: 50, weight: UIFont.Weight.thin)
    
    var animators: [UIViewPropertyAnimator] = []
    
    init() {
        super.init(nibName: String(describing: IntroView.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scrollView.delegate = self
        self.configureViews()
    }
    
}

extension IntroView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let percent = scrollView.contentOffset.x / (scrollView.contentSize.width - self.view.frame.width)
        
        animators.forEach{ $0.fractionComplete = percent }
    }
}

extension IntroView {
    
    func configureViews() {
        let string = "Animations to the next level"
        let labels = string.map {
            createLabel($0)
        }
        
        zip(labels.dropFirst(), labels)
            .forEach { previous, current in
                current.rightAnchor.constraint(equalTo: previous.leftAnchor).isActive = true
            }
        
        labels.last?.pinRight()
        
        self.animators = labels.map { label in
            let random = CGFloat((1...5).randomElement()!) / 10.0
            return UIViewPropertyAnimator(duration: 0.2,
                                          controlPoint1: CGPoint(x: random, y: random),
                                          controlPoint2: CGPoint(x: 1 - random, y: 1 - random), animations: {
                                            let randomPosition = CGFloat(-((10...50).randomElement()!))
                                            label.transform = CGAffineTransform(translationX: 0, y: -randomPosition)
                                            label.alpha = 0
            })
        }
        
        animators.forEach { $0.pausesOnCompletion = true }

        
    }
    
    func createLabel(_ char: Character) -> UILabel {
        let label = UILabel()
        label.prepareForConstraints()
        label.font = self.font
        label.text = "\(char)"
        titleContainer.addSubview(label)
        label.centerVertically()
        return label
    }
    
}
