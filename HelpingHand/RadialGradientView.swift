//
//  RadialGradientView.swift
//  HelpingHand
//
//  Created by amota511 on 1/16/18.
//  Copyright © 2018 Aaron Motayne. All rights reserved.
//

import UIKit

@IBDesignable
class RadialGradientView: UIView {

    @IBInspectable var firstColor: UIColor = UIColor.clear
    @IBInspectable var secondColor: UIColor = UIColor.clear
    
    override func draw(_ rect: CGRect) {
        
        let colors = [firstColor.cgColor, secondColor.cgColor] as CFArray
        let endRadius = max(frame.width, frame.height)
        let center = CGPoint(x: 0, y: bounds.size.height)
        
        let gradient = CGGradient(colorsSpace: nil, colors: colors, locations: nil)
        
        UIGraphicsGetCurrentContext()!.drawRadialGradient(gradient!, startCenter: center, startRadius: 0.0, endCenter: center, endRadius: endRadius, options: .drawsAfterEndLocation)
    }
 

}
