//
//  LogUpViewController.swift
//  Smack
//
//  Created by Awady on 8/30/19.
//  Copyright © 2019 Awady. All rights reserved.
//

import UIKit

class LogUpViewController: UIViewController {
    
    @IBOutlet weak var userNameText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var userImage: UIImageView!
    
    // Variables
    var avatarName = "profileDefault"
    var avatarColor = "[0.5, 0.5, 0.5, 1]"
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func logUpPressed(_ sender: UIButton) {
        guard let name = userNameText.text, userNameText.text != "" else
        { return }
        guard let email = emailText.text, emailText.text != "" else
        { return }
        guard let password = passwordText.text, passwordText.text != "" else
        { return }
        
        AuthServices.instance.regiserUser(email: email, password: password) { (success) in
            if success {
                AuthServices.instance.loginUser(email: email, password: password, comletion: { (success) in
                    if success {
                        AuthServices.instance.createUser(name: name, email: email, avatarName: self.avatarName, avatarColor: self.avatarColor, completion: { (success) in
                            if success {
                                print(UserDataService.instance.name, UserDataService.instance.avatarName)
                                self.performSegue(withIdentifier: UNWIND, sender: nil)
                            }
                        })
                    }
                })
            }
        }
    }
    
    @IBAction func chooseAvatarPressed(_ sender: Any) {
    }
    
    @IBAction func chooseBackColorPressed(_ sender: Any) {
    }
    
    @IBAction func closePressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
}
