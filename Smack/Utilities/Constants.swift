//
//  Constants.swift
//  Smack
//
//  Created by Awady on 8/29/19.
//  Copyright © 2019 Awady. All rights reserved.
//

import Foundation


typealias CompletionHandler = (_ Success: Bool) -> ()

// URL constants
let BASE_URL = "www.ghjk.com"
let URL_REGISTER = "\(BASE_URL)/register"
let URL_LOGIN = "\(BASE_URL)/login"
let URL_USER_ADD = "\(BASE_URL)user/add"
let URL_USER_BY_EMAIL = "\(BASE_URL)user/byEmail/"

//Colors
let smackPurplePlaceHolder = #colorLiteral(red: 0.2588235294, green: 0.3294117647, blue: 0.7254901961, alpha: 0.5)

//Notification Constants
let NOTIF_USER_DATA_DID_CHANGE = Notification.Name("notifUserDataChanged")

// Segues
let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let UNWIND = "unwindToChannel"
let TO_AVATAR_PICKER = "toAvatarPicker"

// User Defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"

//Headers
let HEADER = [
    "Content-Type": "Aplication/Json; charset=utf-8"
]
let BEARER_HEADER = [
    "Authorization":"Bearer \(AuthServices.instance.authToken)",
    "Content-Type": "Aplication/Json; charset=utf-8"
]
