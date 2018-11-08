//
//  Colors.swift
//  AnimationsToTheNextLevel
//
//  Created by Aline Borges on 08/11/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import UIKit

extension CGFloat {
    
    static var random: CGFloat {
        return CGFloat(arc4random()) / 0xFFFFFFFF
    }
    
}

public class Colors {
    
    static let numberOfColors = 24
    
    class func getColor(hue: CGFloat) -> UIColor {
        return UIColor(hue: hue, saturation: 0.5, brightness: 0.8, alpha: 1.0)
    }
    
    class func randomColor() -> UIColor {
        let randomHue:CGFloat = CGFloat.random
        print(randomHue)
        return getColor(hue: randomHue)
    }
    
    class func generateColors(numberOfColors: Int) -> [UIColor] {
        let colorStep:CGFloat = 1.0 / CGFloat(numberOfColors)
        var t = colorStep
        var colors:[UIColor] = []
        
        for _ in 0..<numberOfColors {
            t += colorStep
            if t > 1 {
                t = 0
            }
            
            colors.append(getColor(hue: t))
        }
        
        return colors
    }
}
