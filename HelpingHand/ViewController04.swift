//
//  ViewController04.swift
//  HelpingHand
//
//  Created by amota511 on 12/28/17.
//  Copyright © 2017 Aaron Motayne. All rights reserved.
//

import UIKit

class ViewController04: UIViewController {

    @IBOutlet var signUpOutlet: UIButton!
    @IBAction func signUpButton(_ sender: UIButton) {
        performSegue(withIdentifier: "SignUpSegue", sender: self)
    }
    
    @IBOutlet var signIn: UIButton!
    @IBAction func signInButton(_ sender: UIButton) {
        performSegue(withIdentifier: "SignInSegue", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        signIn.clipsToBounds = true
        signIn.layer.cornerRadius = 5
        
        signUpOutlet.clipsToBounds = true
        signUpOutlet.layer.cornerRadius = 5
    }



}
