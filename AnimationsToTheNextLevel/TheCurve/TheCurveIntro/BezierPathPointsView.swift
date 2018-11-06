//
//  BezierPathPointsView.swift
//  AnimationsToTheNextLevel
//
//  Created by Aline Borges on 06/11/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import UIKit

class BezierPathPointsView: UIView {
    
    var onPointChange: ((CGPoint, CGPoint)->Void)?
    
    var pointAView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        view.frame.size = CGSize(width: 20, height: 20)
        view.layer.cornerRadius = 10
        return view
    }()
    
    var pointBView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        view.frame.size = CGSize(width: 20, height: 20)
        view.layer.cornerRadius = 10
        return view
    }()
    
    var pathLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.strokeColor = UIColor.black.cgColor
        layer.lineWidth = 2.0
        layer.fillColor = UIColor.clear.cgColor
        return layer
    }()
    
    var pointALayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.strokeColor = UIColor.lightGray.cgColor
        layer.lineWidth = 2.0
        layer.fillColor = UIColor.clear.cgColor
        return layer
    }()
    
    var pointBLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.strokeColor = UIColor.lightGray.cgColor
        layer.lineWidth = 2.0
        layer.fillColor = UIColor.clear.cgColor
        return layer
    }()
    
    var startPoint: CGPoint {
         return CGPoint(x: 0, y: self.bounds.height)
    }
    
    var endPoint: CGPoint {
        return CGPoint(x: self.bounds.width, y: 0)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.clipsToBounds = true
        self.addPoints()
        redraw()
        
        self.layer.addSublayer(pointALayer)
        self.layer.addSublayer(pointBLayer)
        self.layer.addSublayer(pathLayer)
    }
    
    func redraw() {
        self.drawCurvePath(pointA: self.pointAView.center, pointB: self.pointBView.center)
        self.drawLine(pointA: startPoint, pointB: pointAView.center, layer: pointALayer)
        self.drawLine(pointA: endPoint, pointB: pointBView.center, layer: pointBLayer)
        updatePoints()
    }
    
    func updatePoints() {
        let pointA = CGPoint(x: pointAView.center.x / self.frame.width,
                             y: pointAView.center.y / self.frame.height)
        let pointB = CGPoint(x: pointBView.center.x / self.frame.width,
                             y: pointBView.center.y / self.frame.height)
        self.onPointChange?(pointA, pointB)
    }
    
    func drawLine(pointA: CGPoint, pointB: CGPoint, layer: CAShapeLayer) {
        let bezierPath = UIBezierPath()
        bezierPath.move(to: pointA)
        bezierPath.addLine(to: pointB)
        
        layer.path = bezierPath.cgPath
    }
    
    func drawCurvePath(pointA: CGPoint, pointB: CGPoint) {
        
        let bezierPath = UIBezierPath()
        bezierPath.move(to: startPoint)
        bezierPath.addCurve(to: endPoint, controlPoint1: pointA, controlPoint2: pointB)
        
        self.pathLayer.path = bezierPath.cgPath
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        guard let touch: UITouch = touches.first else {
                return
        }
        
        let location = touch.location(in: self)
        
        if !self.bounds.contains(location) { return }
        
        if touch.view == pointAView {
            pointAView.center = location
            redraw()
        } else if touch.view == pointBView {
            pointBView.center = location
            redraw()
        }
        
    }
    
    func addPoints() {
        self.pointAView.frame.origin = CGPoint.zero
        self.pointBView.frame.origin = CGPoint.zero
        
        self.addSubview(pointAView)
        self.addSubview(pointBView)
        
        self.layoutIfNeeded()
    }
    
}

