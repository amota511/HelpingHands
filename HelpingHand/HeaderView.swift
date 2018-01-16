//
//  HeaderView.swift
//  HelpingHand
//
//  Created by amota511 on 12/31/17.
//  Copyright © 2017 Aaron Motayne. All rights reserved.
//

import UIKit

class HeaderView: UICollectionReusableView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = .red
    }
    
}
