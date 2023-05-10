//
//  WelcomeViewController.swift
//  AuthorizethionApp
//
//  Created by Makssir on 10/05/2023.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var welcomeLabel: UILabel!
       
       var nickName: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Hey, " + nickName + "!"
    }
}
