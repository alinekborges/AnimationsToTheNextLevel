//
//  FactCell.swift
//  AnimationsToTheNextLevel
//
//  Created by Aline Borges on 09/11/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import Foundation
import UIKit

class FactCell: UITableViewCell {
    
    @IBOutlet weak var factLabel: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setItem(fact: String) {
        
        self.backgroundImage.image = randomImage()
        self.factLabel.text = fact
        
        self.factLabel.font = self.factLabel.font.withSize(fontSize(forString: fact))
        
    }

    private func randomImage() -> UIImage? {
        let random = (1...12).randomElement()!
        return UIImage(named: "img_\(random)")
    }
    
    private func fontSize(forString string: String) -> CGFloat {
        return string.count < 80 ?
            34 : 20
    }
}
