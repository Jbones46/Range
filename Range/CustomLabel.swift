//
//  CustomLabel.swift
//  Range
//
//  Created by Justin Ferre on 10/25/15.
//  Copyright © 2015 Justin Ferre. All rights reserved.
//

import UIKit

class CustomLabel: UILabel {

   
    
    override func awakeFromNib() {
        layer.cornerRadius = 4.0
        layer.shadowColor = UIColor(red: SHADOW_COLOR, green: SHADOW_COLOR, blue: SHADOW_COLOR, alpha: 0.5).CGColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSizeMake(0.0, 2.0)
        
    }

    
}
