//
//  ViewController.swift
//  AuthorizethionApp
//
//  Created by Makssir on 10/05/2023.
//

import UIKit

class LoginViewController: UIViewController {


    @IBOutlet weak var forgotUsernameButton: UIButton!
   
    @IBOutlet weak var forgotPasswordButton: UIButton!
    
    @IBOutlet weak var userTextField: UITextField!

    @IBOutlet weak var passwordTextField: UITextField!
    
       override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
           if userTextField.text == "User" && passwordTextField.text == "Password"  {
               return true
           }else {
               showAlert(with: "Wrong Credentials", and: "Please check you login and password")
               return false
           }
       }
       
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           guard let nickName = userTextField.text else { return }
           guard let tapBar = segue.destination as? UITabBarController else { return }
           guard let viewControllers = tapBar.viewControllers else { return }
           
           for viewController in viewControllers {
               if let welcomeVC = viewController as? WelcomeViewController {
                   welcomeVC.nickName = nickName
               }
                   
           }
           
           
       }
       
       override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
           super .touchesBegan(touches, with: event)
           view.endEditing(true)
       }
       
   // MARK: - IBActions
//
    
    @IBAction func forgotNameButtonPressed() {
        showAlert(with: "🥲 Oups", and: "Your login is User")
    }
    
    
//       @IBAction func forgotNameButtonPressed() {
//           showAlert(with: "🥲 Oups", and: "Your login is User")
//       }
//
    
    @IBAction func forgotPassButtonPressed() {
    }
    
//       @IBAction func forgotPassButtonPressed() {
//           showAlert(with: "🔐 Password", and: "Your password is Password")
//       }
//
       @IBAction func unwindSegue(_ segue: UIStoryboardSegue) {
           passwordTextField.text = ""
           userTextField.text = ""
       }
   }

   // MARK: - AlertController

   extension LoginViewController {
       private func showAlert(with title: String, and massage: String) {
           let alert = UIAlertController(
               title: title,
               message: massage,
               preferredStyle: .alert)
           
           let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
               self.passwordTextField.text = ""
           }
           
           alert.addAction(okAction)
           present(alert, animated: true)
       }
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//    }


}

