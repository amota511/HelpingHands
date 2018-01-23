//
//  SharedDetailVCFunctionality.swift
//  HelpingHand
//
//  Created by amota511 on 1/19/18.
//  Copyright © 2018 Aaron Motayne. All rights reserved.
//

import UIKit

class SharedDetailVCFunctionality: UIViewController {
    
    
    func setup() {
        createCancelButton()
    }
    
    func createCancelButton() {
        
        let cancelButton = UIButton(type: .system)
        
        cancelButton.setTitle("X", for: .normal)
        cancelButton.setTitleColor(.white, for: .normal)
        
        let length = self.view.frame.width * 0.075
        cancelButton.frame.size = CGSize(width: length, height: length)
        cancelButton.frame.origin = CGPoint(x: self.view.frame.width - 12 - length, y: 12)
        
        cancelButton.backgroundColor = .lightGray
        cancelButton.layer.cornerRadius = cancelButton.frame.width / 2
        
        cancelButton.addTarget(self, action: #selector(closeDetailView), for: .touchUpInside)
        
        self.view.addSubview(cancelButton)
    }
    
    @objc func closeDetailView(sender: UIButton) {
        print("close")
        
        for view in self.view.subviews {
            view.removeFromSuperview()
        }
        
        UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: [.curveEaseOut], animations: {
            self.view.frame = CGRect(x: self.view.frame.origin.x, y: self.view.frame.midY, width: self.view.frame.width, height: 0)
        }) { (completed) in
            let parent = self.parent as! CustomerHome
            parent.collectionView.isScrollEnabled = true
            self.view.removeFromSuperview()
            self.removeFromParentViewController()
        }
        
    }
}
