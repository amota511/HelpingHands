//
//  TransportationDetailVC.swift
//  HelpingHand
//
//  Created by amota511 on 1/18/18.
//  Copyright © 2018 Aaron Motayne. All rights reserved.
//

import UIKit

class TransportationDetailVC: SharedDetailVCFunctionality {

    var titleLabel: UILabel!
    var newRideButton: UIButton!
    var orLabel: UILabel!
    var existingRideButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = RadialGradientView()
        
        let gradientView = self.view as! RadialGradientView
        gradientView.firstColor = UIColor(r: 34, g: 132, b: 174)
        gradientView.secondColor = UIColor(r: 35, g: 214, b: 180)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setup()
        let gradientView = self.view as! RadialGradientView
        gradientView.roundCorners(amt: 10)
        configureTitleLabel()
        createNewRideButton()
        createORLabel()
        createExistingRideButton()
    }
    
    func configureTitleLabel() {
        titleLabel = UILabel(frame: CGRect(origin: CGPoint(x: 8, y: 25), size: CGSize(width: self.view.bounds.width - 8, height: self.view.bounds.height * 0.15)))
        titleLabel.text = "Transportation"
        titleLabel.textColor = .white
        titleLabel.textAlignment = .left
        
        titleLabel.numberOfLines = 1
        
        titleLabel.font = UIFont.boldSystemFont(ofSize: 30)
        
        self.view.addSubview(titleLabel)
    }
    
    func createNewRideButton() {
        
        newRideButton = UIButton(type: .roundedRect)
        
        let buttonWidth = self.view.frame.width * 0.75
        let buttonHeight = self.view.frame.height * 0.07
        
        let newRideButtonFrame = CGRect(x: self.view.frame.midX - (buttonWidth /  2), y: self.view.frame.midY - buttonHeight - (self.view.frame.height * 0.1), width: buttonWidth, height: buttonHeight)
        
        newRideButton.frame = newRideButtonFrame
        
        newRideButton.setTitle("New Ride", for: .normal)
        newRideButton.setTitleColor(UIColor.white, for: .normal)
        
        newRideButton.tintColor = UIColor.white
        newRideButton.tintColorDidChange()
        
        newRideButton.layer.borderColor = UIColor.white.cgColor
        newRideButton.layer.borderWidth = 1
        
        newRideButton.titleLabel?.font = newRideButton.titleLabel?.font.withSize(22)
        
        newRideButton.layer.cornerRadius = 3.5
        newRideButton.clipsToBounds = true
        
        newRideButton.addTarget(self, action: #selector(newRideButtonSelected), for: .touchUpInside)
        
        view.addSubview(newRideButton)
    }
    
    @objc func newRideButtonSelected() {
        
    }
    
    
    func createORLabel() {
        
        let labelWidth = self.view.bounds.width - 8
        let labelHeight = self.view.bounds.height * 0.15
            
        orLabel = UILabel(frame: CGRect(origin: CGPoint(x: self.view.frame.midX - (labelWidth / 2), y: self.view.frame.midY - (labelHeight / 2)), size: CGSize(width: labelWidth, height: labelHeight)))
        
        orLabel.text = "OR"
        orLabel.textColor = .white
        orLabel.textAlignment = .center
        
        orLabel.numberOfLines = 1
        
        orLabel.font = UIFont.boldSystemFont(ofSize: 32)
        
        self.view.addSubview(orLabel)
    }
    
    func createExistingRideButton() {
        
        existingRideButton = UIButton(type: .roundedRect)
        
        let buttonWidth = self.view.frame.width * 0.75
        let buttonHeight = self.view.frame.height * 0.07
        
        let existingRideButtonFrame = CGRect(x: self.view.frame.midX - (buttonWidth /  2), y: self.view.frame.midY + buttonHeight + (self.view.frame.height * 0.1), width: buttonWidth, height: buttonHeight)
        
        existingRideButton.frame = existingRideButtonFrame
        
        existingRideButton.setTitle("New Ride", for: .normal)
        existingRideButton.setTitleColor(UIColor.white, for: .normal)
        
        existingRideButton.tintColor = UIColor.white
        existingRideButton.tintColorDidChange()
        
        existingRideButton.layer.borderColor = UIColor.white.cgColor
        existingRideButton.layer.borderWidth = 1
        
        existingRideButton.titleLabel?.font = newRideButton.titleLabel?.font.withSize(22)
        
        existingRideButton.layer.cornerRadius = 3.5
        existingRideButton.clipsToBounds = true
        
        existingRideButton.addTarget(self, action: #selector(existingRideButtonSelected), for: .touchUpInside)
        
        view.addSubview(existingRideButton)
    }
    
    @objc func existingRideButtonSelected() {
        
    }

}
