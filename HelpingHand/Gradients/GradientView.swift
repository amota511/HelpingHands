//
//  GradientView.swift
//  Pods-HelpingHand
//
//  Created by amota511 on 1/16/18.
//

import UIKit

@IBDesignable
class GradientView: UIView {

    @IBInspectable var firstColor: UIColor = UIColor.clear {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var secondColor: UIColor = UIColor.clear {
        didSet {
            updateView()
        }
    }
    
    override class var layerClass: AnyClass {
        get {
            return CAGradientLayer.self
        }
    }
    
    func updateView() {
        
        let layer = self.layer as! CAGradientLayer
        layer.colors = [firstColor.cgColor, secondColor.cgColor]

        layer.startPoint = CGPoint(x: 0, y: 0)
        layer.endPoint = CGPoint(x: 0, y: 1)
        
//        view.layer.insertSublayer(layer, at: 0)
    }

}
