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
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    // Variables
    var avatarName = "profileDefault"
    var avatarColor = "[0.5, 0.5, 0.5, 1]"
    var backGroundColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDataService.instance.avatarName != "" {
            userImage.image = UIImage(named: UserDataService.instance.avatarName)
            avatarName = UserDataService.instance.avatarName
            if avatarName.contains("light") && backGroundColor == nil {
                userImage.backgroundColor = UIColor.lightGray
            }
        }
    }
    
    @IBAction func logUpPressed(_ sender: UIButton) {
        spinner.isHidden = false
        spinner.startAnimating()
        
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
                                self.spinner.isHidden = true
                                self.spinner.stopAnimating()
                                self.performSegue(withIdentifier: UNWIND, sender: nil)
                                NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
                            }
                        })
                    }
                })
            }
        }
    }
    
    @IBAction func chooseAvatarPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_AVATAR_PICKER, sender: nil)
    }
    
    @IBAction func chooseBackColorPressed(_ sender: Any) {
        let red = CGFloat(arc4random_uniform(255)) / 255
        let green = CGFloat(arc4random_uniform(255)) / 255
        let blue = CGFloat(arc4random_uniform(255)) / 255
        
      backGroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
        UIView.animate(withDuration: 0.2) {
            self.userImage.backgroundColor = self.backGroundColor
        }
    }
    
    @IBAction func closePressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
    func setUpView() {
        spinner.isHidden = true
        
        userNameText.attributedPlaceholder = NSAttributedString(string: "username", attributes: [NSAttributedString.Key.foregroundColor:smackPurplePlaceHolder])
        emailText.attributedPlaceholder = NSAttributedString(string: "email", attributes: [NSAttributedString.Key.foregroundColor:smackPurplePlaceHolder])
        passwordText.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedString.Key.foregroundColor:smackPurplePlaceHolder])
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(LogUpViewController.handleTap))
        view.addGestureRecognizer(tap)
    }
    
    @objc func handleTap() {
        view.endEditing(true)
    }
}
