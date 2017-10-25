//
//  Color.swift
//  iBasqueRadio
//
//  Created by Gorka Ercilla on 25/10/17.
//  Copyright © 2017 Gorka Ercilla. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience init(r: Double, g: Double, b: Double, a: Double = 100) {
        self.init(red: CGFloat(r/255.0), green: CGFloat(g/255.0), blue: CGFloat(b/255.0), alpha: CGFloat(a/100.0))
    }
    
    struct Palette {
        struct Brand {
            static let Red = UIColor(r: 75, g: 16, b: 24)
            
        }
        
    }
}
