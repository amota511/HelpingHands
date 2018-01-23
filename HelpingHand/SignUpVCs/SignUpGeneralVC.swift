//
//  SignUpGeneralVC.swift
//  HelpingHand
//
//  Created by amota511 on 12/29/17.
//  Copyright © 2017 Aaron Motayne. All rights reserved.
//

import UIKit

class SignUpGeneralVC: UIViewController {

    lazy var cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = UIColor.white
        button.setImage(#imageLiteral(resourceName: "back_icon"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleCancel), for: .touchUpInside)
        return button
    }()
    
    @IBOutlet var customerOutlet: UIButton!
    @IBAction func customerButton(_ sender: UIButton) {
        performSegue(withIdentifier: "SignUpCustomerSegue", sender: self)
    }
    
    @IBOutlet var driverOutlet: UIButton!
    @IBAction func driverButton(_ sender: UIButton) {
        performSegue(withIdentifier: "SignUpDriverSegue", sender: self)
    }
    
    @IBOutlet var nurseOutlet: UIButton!
    @IBAction func nurseButton(_ sender: UIButton) {
        performSegue(withIdentifier: "SignUpNurseSegue", sender: self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customerOutlet.clipsToBounds = true
        customerOutlet.layer.cornerRadius = 5
        
        driverOutlet.clipsToBounds = true
        driverOutlet.layer.cornerRadius = 5
        
        nurseOutlet.clipsToBounds = true
        nurseOutlet.layer.cornerRadius = 5
        
        view.addSubview(cancelButton)
        setCancelButton()
    }

    func setCancelButton() {
        cancelButton.leftAnchor.constraint(equalTo:view.leftAnchor, constant: 12).isActive = true
        cancelButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 24).isActive = true
        cancelButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/10).isActive = true
        cancelButton.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/10).isActive = true
    }
    
    @objc func handleCancel(){
        self.removeFromParentViewController()
        self.dismiss(animated: true, completion: nil)
    }
}
